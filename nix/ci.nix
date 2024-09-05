{ pkgs }:
let

  envoy_protos = pkgs.writeShellScriptBin "buildEnvoyProtos" ''
    set -o pipefail
    export MIX_ENV=devl
    export PATH=$PATH:.nix-mix/escripts
    export MIRROR_MSG="Mirrored from envoyproxy/data_plane_api"

    get_last_envoy_sha () {
      git log \
      --grep="$MIRROR_MSG" -n 1 \
      | grep "$MIRROR_MSG" \
      | tail -n 1 \
      | sed -e "s#.*$MIRROR_MSG @ ##"
    }

    git clone https://github.com/envoyproxy/data-plane-api.git

    ${pkgs.elixir}/bin/mix escript.install hex protobuf --force
    ${pkgs.buf}/bin/buf generate data-plane-api --include-imports --path data-plane-api/envoy
    # the ollowing files are already included in the google protos mix deps
    rm envoy_xds/google/api/http.pb.ex
    rm envoy_xds/google/api/pb_extension.pb.ex

    git add lib

    local last_envoy_sha changes changed
    echo "Committing changes ..."
    changed="$(git diff HEAD --name-only | grep -v lib/COMMIT || :)"
    if [[ -z "$changed" ]]; then
        echo "Nothing changed, not committing"
        return
    fi

    last_envoy_sha="$(get_last_envoy_sha)"
    echo "Latest Envoy DataPlane SHA: $last_envoy_sha"
    changes="$(git -C data-plane-api rev-list "$last_envoy_sha"..HEAD)"
    echo "Changes detected: "
    echo "$changes"
    latest_commit="$(git -C data-plane-api rev-list HEAD -n1)"
    echo "Latest commit: $latest_commit"
    echo "$latest_commit" > lib/COMMIT
    git commit --allow-empty -s -m "$MIRROR_MSG @ $latest_commit"

  '';

in
with pkgs;
mkShell {
  packages =
    [
      beamPackages.hex
      elixir
      envoy_protos
    ];
}
