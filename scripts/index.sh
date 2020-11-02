#!/bin/sh

_base_work_path="/home/luxcium/.local/src/nestjs-colligated-docs"
_scripts_dir="${_base_work_path}/scripts"
_functions_dir="${_scripts_dir}/functions"
# /home/luxcium/.local/src/nestjs-colligated-docs/scripts/functions
source "${_functions_dir}/stamp-functions.sh"

_tmp_work_path="/tmp/docs.nestjs.com-${_snDATEu}-${_snTIMEshortu}-$(getSTMP4_)"
_tmp_flags_path="${_tmp_work_path}/flags-$(getSTMP4_)"
_tmp_out_path="${_tmp_work_path}/out-$(getSTMP4_)"
_tmp_assets_path="${_tmp_work_path}/src/assets"
_tmp_content_path="${_tmp_work_path}/content"

_pTMP_PATH="${_tmp_work_path}"
_pTMP_PATH_flags="${_tmp_flags_path}"
_pASSETS="${_tmp_assets_path}/src/assets"
_pCONTENT="${_tmp_content_path}/content"

_imgpath="./content/assets/svg"
_FILENAME_path="/home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts"
_FILENAME="random.md"
_output_path_temp="${_FILENAME_path}/${_FILENAME}"
_short_Url="${_FILENAME}"

_pTMP_content="${_pTMP_PATH}/content"

_long_Url_site="https://docs.nestjs.com/"

_sect1="# "
_sect2="## "
_sect3="### "
_sect4="#### "

_imgwidth1=30
_imgwidth2=25
_imgwidth3=20

# _pTMP_PATH="/tmp/docs.nestjs.com-$(getSTMP8a_)"

_imgpath="../svg"
_iconpath="../svg"

# !! FETCHING FROM THE REPO https://github.com/nestjs/docs.nestjs.com.git
gh repo clone nestjs/docs.nestjs.com ${_pTMP_PATH}

source "${_functions_dir}/icons-functions.sh"
source "${_functions_dir}/flags-functions.sh"
source "${_functions_dir}/cat-functions.sh"

builtin cd "${_pTMP_content}"
setSection_ "" "Introduction" ""
setSubSection_ "/" "Introduction" "introduction.md"
echo "_pTMP_content: ${_pTMP_content}"
builtin cd "${_pTMP_content}"
setSection_ "" "Overview" ""
# -------------------------------------------------------------
setSubSection_ "/first-steps" "First steps" "first-steps.md"
setSubSection_ "/controllers" "Controllers" "controllers.md"
setSubSection_ "/providers" "Providers" "components.md"
setSubSection_ "/modules" "Modules" "modules.md"
setSubSection_ "/middleware" "Middleware" "middlewares.md"
setSubSection_ "/exception-filters" "Exception filters" "exception-filters.md"
setSubSection_ "/pipes" "Pipes" "pipes.md"
setSubSection_ "/guards" "Guards" "guards.md"
setSubSection_ "/interceptors" "Interceptors" "interceptors.md"
setSubSection_ "/custom-decorators" "Custom decorators" "custom-decorators.md"
# write_Section_

builtin cd "${_pTMP_content}/fundamentals"
setSection_ "" "Fundamentals" ""
# -------------------------------------------------------------
setSubSection_ "/fundamentals/custom-providers" "Custom providers" "dependency-injection.md"
setSubSection_ "/fundamentals/async-providers" "Asynchronous providers" "async-components.md"
setSubSection_ "/fundamentals/dynamic-modules" "Dynamic modules" "dynamic-modules.md"
setSubSection_ "/fundamentals/injection-scopes" "Injection scopes" "provider-scopes.md"
setSubSection_ "/fundamentals/circular-dependency" "Circular dependency" "circular-dependency.md"
setSubSection_ "/fundamentals/module-ref" "Module reference" "module-reference.md"
setSubSection_ "/fundamentals/execution-context" "Execution context" "execution-context.md"
setSubSection_ "/fundamentals/lifecycle-events" "Lifecycle events" "lifecycle-events.md"
setSubSection_ "/fundamentals/platform-agnosticism" "Platform agnosticism" "platform-agnosticism.md"
setSubSection_ "/fundamentals/testing" "Testing" "unit-testing.md"
# write_Section_

builtin cd "${_pTMP_content}/techniques"
setSection_ "" "Techniques" ""
# -------------------------------------------------------------
setSubSection_ "/techniques/authentication" "Authentication" "authentication.md"
setSubSection_ "/techniques/database" "Database" "sql.md"
setSubSection_ "/techniques/mongodb" "Mongo" "mongo.md"
setSubSection_ "/techniques/configuration" "Configuration" "configuration.md"
setSubSection_ "/techniques/validation" "Validation" "validation.md"
setSubSection_ "/techniques/caching" "Caching" "caching.md"
setSubSection_ "/techniques/serialization" "Serialization" "serialization.md"
setSubSection_ "/techniques/task-scheduling" "Task scheduling" "task-scheduling.md"
setSubSection_ "/techniques/compression" "Compression" "compression.md"
setSubSection_ "/techniques/security" "Security" "security.md"
setSubSection_ "/techniques/queues" "Queues" "queues.md"
setSubSection_ "/techniques/logger" "Logger" "logger.md"
setSubSection_ "/techniques/file-upload" "File upload" "file-upload.md"
setSubSection_ "/techniques/http-module" "HTTP module" "http-module.md"
setSubSection_ "/techniques/mvc" "Model-View-Controller" "mvc.md"
setSubSection_ "/techniques/performance" "Performance (Fastify)" "performance.md"
# write_Section_

builtin cd "${_pTMP_content}/graphql"
setSection_ "" "Graphql" ""
# -------------------------------------------------------------
setSubSection_ "/graphql/quick-start" "Quick start" "quick-start.md"
setSubSection_ "/graphql/resolvers" "Resolvers" "resolvers-map.md"
setSubSection_ "/graphql/mutations" "Mutations" "mutations.md"
setSubSection_ "/graphql/subscriptions" "Subscriptions" "subscriptions.md"
setSubSection_ "/graphql/scalars" "Scalars" "scalars.md"
setSubSection_ "/graphql/directives" "Directives" "directives.md"
setSubSection_ "/graphql/plugins" "Plugins" "plugins.md"
setSubSection_ "/graphql/interfaces" "Interfaces" "interfaces.md"
setSubSection_ "/graphql/unions" "Unions" "unions.md"
setSubSection_ "/graphql/enums" "Enums" "enums.md"
setSubSection_ "/graphql/mapped-types" "Mapped types" "mapped-types.md"
setSubSection_ "/graphql/complexity" "Complexity" "complexity.md"
setSubSection_ "/graphql/extensions" "Extensions" "extensions.md"
setSubSection_ "/graphql/cli-plugin" "CLI Plugin" "cli-plugin.md"
setSubSection_ "/graphql/generating-sdl" "Generating SDL" "schema-generator.md"
setSubSection_ "/graphql/other-features" "Other features" "guards-interceptors.md"
setSubSection_ "/graphql/federation" "Federation" "federation.md"
# write_Section_

builtin cd "${_pTMP_content}/websockets"
setSection_ "" "Websockets" ""
# -------------------------------------------------------------
setSubSection_ "/websockets/gateways" "Gateways" "gateways.md"
setSubSection_ "/websockets/exception-filters" "Exception filters" "exception-filters.md"
setSubSection_ "/websockets/pipes" "Pipes" "pipes.md"
setSubSection_ "/websockets/guards" "Guards" "guards.md"
setSubSection_ "/websockets/interceptors" "Interceptors" "interceptors.md"
setSubSection_ "/websockets/adapter" "Adapters" "adapter.md"
# write_Section_

builtin cd "${_pTMP_content}/microservices"
setSection_ "" "Microservices" ""
# -------------------------------------------------------------
setSubSection_ "/microservices/basics" "Overview" "basics.md"
setSubSection_ "/microservices/redis" "Redis" "redis.md"
setSubSection_ "/microservices/mqtt" "MQTT" "mqtt.md"
setSubSection_ "/microservices/nats" "NATS" "nats.md"
setSubSection_ "/microservices/rabbitmq" "RabbitMQ" "rabbitmq.md"
setSubSection_ "/microservices/kafka" "Kafka" "kafka.md"
setSubSection_ "/microservices/grpc" "gRPC" "grpc.md"
setSubSection_ "/microservices/exception-filters" "Exception filters" "exception-filters.md"
setSubSection_ "/microservices/pipes" "Pipes" "pipes.md"
setSubSection_ "/microservices/guards" "Guards" "guards.md"
setSubSection_ "/microservices/interceptors" "Interceptors" "interceptors.md"
# write_Section_

builtin cd "${_pTMP_content}"
setSection_ "" "Standalone applications" ""
# -------------------------------------------------------------
setSubSection_ "/standalone-applications" "Standalone Apps" "application-context.md"
# write_Section_

builtin cd "${_pTMP_content}/cli"
setSection_ "" "Cli" ""
# -------------------------------------------------------------
setSubSection_ "/cli/overview" "Overview" "overview.md"
setSubSection_ "/cli/monorepo" "Workspaces" "workspaces.md"
setSubSection_ "/cli/libraries" "Libraries" "libraries.md"
setSubSection_ "/cli/usages" "Usage" "usages.md"
setSubSection_ "/cli/scripts" "Scripts" "scripts.md"
# write_Section_

builtin cd "${_pTMP_content}/openapi"
setSection_ "" "Openapi" ""
# -------------------------------------------------------------
setSubSection_ "/openapi/introduction" "Introduction" "introduction.md"
setSubSection_ "/openapi/types-and-parameters" "Types and Parameters" "types-and-parameters.md"
setSubSection_ "/openapi/operations" "Operations" "operations.md"
setSubSection_ "/openapi/security" "Security" "security.md"
setSubSection_ "/openapi/mapped-types" "Mapped Types" "mapped-types.md"
setSubSection_ "/openapi/decorators" "Decorators" "decorators.md"
setSubSection_ "/openapi/cli-plugin" "CLI Plugin" "cli-plugin.md"
setSubSection_ "/openapi/other-features" "Other features" "other-features.md"
setSubSection_ "/openapi/migration-guide" "Migration guide" "migration-guide.md"
# write_Section_

builtin cd "${_pTMP_content}/recipes"
setSection_ "" "Recipes" ""
# -------------------------------------------------------------
setSubSection_ "/recipes/sql-typeorm" "TypeORM" "sql-typeorm.md"
setSubSection_ "/recipes/mongodb" "Mongoose" "mongodb.md"
setSubSection_ "/recipes/sql-sequelize" "Sequelize" "sql-sequelize.md"
# setSubSection_ "/recipes/swagger" "OpenAPI (Swagger)" "!!! OpenAPI section"
setSubSection_ "/recipes/cqrs" "CQRS" "cqrs.md"
setSubSection_ "/recipes/prisma" "Prisma" "prisma.md"
setSubSection_ "/recipes/terminus" "Health checks (Terminus)" "terminus.md"
setSubSection_ "/recipes/documentation" "Documentation" "documentation.md"
setSubSection_ "/recipes/hot-reload" "Hot reload" "hot-reload.md"
setSubSection_ "/recipes/serve-static" "Serve static" "serve-static.md"
# write_Section_

builtin cd "${_pTMP_content}/faq"
setSection_ "" "FAQ" ""
# -------------------------------------------------------------
setSubSection_ "/faq/http-adapter" "HTTP adapter" "http-adapter.md"
setSubSection_ "/faq/global-prefix" "Global path prefix" "global-prefix.md"
setSubSection_ "/faq/hybrid-application" "Hybrid application" "hybrid-application.md"
setSubSection_ "/faq/multiple-servers" "HTTPS &amp; multiple servers" "multiple-servers.md"
setSubSection_ "/faq/request-lifecycle" "Request lifecycle" "request-lifecycle.md"
# write_Section_

builtin cd "${_pTMP_content}/"
setSection_ "" "Migration guide" ""
# -------------------------------------------------------------
setSubSection_ "/migration-guide" "Migration guide " "migration.md"
# write_Section_
