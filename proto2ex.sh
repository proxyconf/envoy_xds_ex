cd ./priv
git clone --depth 1 https://github.com/envoyproxy/data-plane-api
git clone --depth 1 https://github.com/cncf/xds.git
git clone --depth 1 https://github.com/bufbuild/protoc-gen-validate.git
git clone --depth 1 https://github.com/grpc/grpc-proto.git
git clone --depth 1 https://github.com/googleapis/googleapis.git

cd ..

# used for external processor

protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ ./priv/data-plane-api/envoy/service/ext_proc/v3/external_processor.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ ./priv/data-plane-api/envoy/config/core/v3/base.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ ./priv/grpc-proto/grpc/health/v1/health.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ ./priv/data-plane-api/envoy/extensions/filters/http/ext_proc/v3/processing_mode.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ ./priv/data-plane-api/envoy/type/v3/http_status.proto

# used for xds
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/service/discovery/v3/discovery.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/service/cluster/v3/cds.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/service/discovery/v3/ads.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/service/endpoint/v3/eds.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/service/route/v3/rds.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/service/listener/v3/lds.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/service/secret/v3/sds.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/service/runtime/v3/rtds.proto 
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/type/v3/semantic_version.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/cluster/v3/cluster.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/core/v3/protocol.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/listener/v3/listener.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/core/v3/address.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/listener/v3/listener_components.proto

protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/extensions/filters/network/http_connection_manager/v3/http_connection_manager.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/route/v3/route.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/extensions/filters/network/http_connection_manager/v3/http_connection_manager.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/extensions/filters/http/router/v3/router.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/route/v3/route_components.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/endpoint/v3/endpoint_components.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/core/v3/health_check.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/type/v3/http.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/endpoint/v3/endpoint_components.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/endpoint/v3/endpoint.proto 
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/googleapis/google/rpc/status.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/extensions/upstreams/http/v3/http_protocol_options.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/type/matcher/v3/regex.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/type/matcher/v3/string.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/core/v3/extension.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/extensions/path/match/uri_template/v3/uri_template_match.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/extensions/path/rewrite/uri_template/v3/uri_template_rewrite.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/extensions/filters/http/lua/v3/lua.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/contrib/envoy/extensions/filters/http/golang/v3alpha/golang.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/xds/xds/type/v3/typed_struct.proto
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/extensions/filters/http/jwt_authn/v3/config.proto 
protoc --elixir_out=plugins=grpc:./lib -I./priv/data-plane-api/ -I./priv/xds/ -I./priv/protoc-gen-validate/ -I./priv/grpc-proto/ -I./priv/googleapis/ ./priv/data-plane-api/envoy/config/core/v3/http_uri.proto 

