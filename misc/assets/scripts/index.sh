source /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/cat-functions.sh

pTMP_PATH="/tmp/docs.nestjs.com-$(getSTMP8a)"
pTMP_content_="${pTMP_PATH}/content"

gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH} # && cd ${pTMP_PATH}/content/
cp -r /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/ ${pTMP_PATH}/content
cd ${pTMP_PATH}/content
mkdir build
# pTMP_content_="${pTMP_PATH}/content"
long_Url_="https://docs.nestjs.com/"
randy001=$(getSTMP8a)
function setSubSection_() {
  # cat $3

  short_Url="${1}"
  _sectionText="${2}"
  _anchorid_current="$(getSTMP8)"
  _anchorid_top="$(getSTMP8)"
  _anchorid_previous="$(getSTMP8)"
  _anchorid_next="$(getSTMP8)"
  _imgwidth=${_imgwidth3}
  echo $(_create_sub_section) >>/home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/some-${randy001}.md
  # function _create_sub_section() {
  #   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) ${_sectionText} $(imagetag_logo_small) $(imagetag_chevron_up)
  # }
}

function setSection_() {
  # cat $3

  short_Url="${1}"
  _sectionText="${2}"
  _anchorid_current="$(getSTMP8)"
  _anchorid_top="$(getSTMP8)"
  _anchorid_previous="$(getSTMP8)"
  _anchorid_next="$(getSTMP8)"
  _imgwidth=${_imgwidth3}
  echo $(_create_section) >>/home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/some-${randy001}.md
  # function _create_sub_section() {
  #   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) ${_sectionText} $(imagetag_logo_small) $(imagetag_chevron_up)
  # }
}
#
cd "${pTMP_content_}"

setSection_ "" "Introduction" ""

setSubSection_ "/" "Introduction" "introduction.md"

cd "${pTMP_content_}"

setSection_ "" "Overview" ""

setSubSection_ "/first-steps" "First steps" "first-steps.md"
setSubSection_ "/controllers" "Controllers" "controllers.md"
setSubSection_ "/providers" "Providers" "components.md"
setSubSection_ "/modules" "Modules" "modules.md"
setSubSection_ "/middleware" "Middleware" " middlewares.md"
setSubSection_ "/exception-filters" "Exception filters" "exception-filters.md"
setSubSection_ "/pipes" "Pipes" "pipes.md"
setSubSection_ "/guards" "Guards" "guards.md"
setSubSection_ "/interceptors" "Interceptors" "interceptors.md"
setSubSection_ "/custom-decorators" "Custom decorators" "custom-decorators.md"

cd "${pTMP_content_}/fundamentals"
setSection_ "" "Fundamentals" ""

setSubSection_ "/fundamentals/custom-providers" "Custom providers" "dependency-injection.md"
setSubSection_ "/fundamentals/async-providers" "Asynchronous providers" "async-components.md"
setSubSection_ "/fundamentals/dynamic-modules" "Dynamic modules" "dynamic-modules.md"
setSubSection_ "/fundamentals/injection-scopes" "Injection scopes" "provider-scopes.md"
setSubSection_ "/fundamentals/circular-dependency" "Circular dependency" " circular-dependency.md"
setSubSection_ "/fundamentals/module-ref" "Module reference" "module-reference.md"
setSubSection_ "/fundamentals/execution-context" "Execution context" "execution-context.md"
setSubSection_ "/fundamentals/lifecycle-events" "Lifecycle events" "lifecycle-events.md"
setSubSection_ "/fundamentals/platform-agnosticism" "Platform agnosticism" "platform-agnosticism.md"
setSubSection_ "/fundamentals/testing" "Testing" "unit-testing.md"

cd "${pTMP_content_}/techniques"
setSection_ "" "Techniques" ""

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

cd "${pTMP_content_}/graphql"
setSection_ "" "Graphql" ""

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

cd "${pTMP_content_}/websockets"
setSection_ "" "Websockets" ""

setSubSection_ "/websockets/gateways" "Gateways" "gateways.md"
setSubSection_ "/websockets/exception-filters" "Exception filters" "exception-filters.md"
setSubSection_ "/websockets/pipes" "Pipes" "pipes.md"
setSubSection_ "/websockets/guards" "Guards" "guards.md"
setSubSection_ "/websockets/interceptors" "Interceptors" "interceptors.md"
setSubSection_ "/websockets/adapter" "Adapters" "adapter.md"

cd "${pTMP_content_}/microservices"
setSection_ "" "Microservices" ""

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

cd "${pTMP_content_}"
setSection_ "" "Standalone applications" ""

setSubSection_ "/standalone-applications" "Standalone Apps" "application-context.md"

cd "${pTMP_content_}/cli"
setSection_ "" "Cli" ""

setSubSection_ "/cli/overview" "Overview" "overview.md"
setSubSection_ "/cli/monorepo" "Workspaces" "workspaces.md"
setSubSection_ "/cli/libraries" "Libraries" "libraries.md"
setSubSection_ "/cli/usages" "Usage" "usages.md"
setSubSection_ "/cli/scripts" "Scripts" "scripts.md"

cd "${pTMP_content_}/openapi"
setSection_ "" "Openapi" ""

setSubSection_ "/openapi/introduction" "Introduction" "introduction.md"
setSubSection_ "/openapi/types-and-parameters" "Types and Parameters" "types-and-parameters.md"
setSubSection_ "/openapi/operations" "Operations" "operations.md"
setSubSection_ "/openapi/security" "Security" "security.md"
setSubSection_ "/openapi/mapped-types" "Mapped Types" "mapped-types.md"
setSubSection_ "/openapi/decorators" "Decorators" "decorators.md"
setSubSection_ "/openapi/cli-plugin" "CLI Plugin" "cli-plugin.md"
setSubSection_ "/openapi/other-features" "Other features" "other-features.md"
setSubSection_ "/openapi/migration-guide" "Migration guide" "migration-guide.md"

cd "${pTMP_content_}/recipes"
setSection_ "" "Recipes" ""

setSubSection_ "/recipes/sql-typeorm" "TypeORM" "sql-typeorm.md"
setSubSection_ "/recipes/mongodb" "Mongoose" "mongodb.md"
setSubSection_ "/recipes/sql-sequelize" "Sequelize" "sql-sequelize.md"
setSubSection_ "/recipes/swagger" "OpenAPI (Swagger)" "!!! OpenAPI section"
setSubSection_ "/recipes/cqrs" "CQRS" "cqrs.md"
setSubSection_ "/recipes/prisma" "Prisma" "prisma.md"
setSubSection_ "/recipes/terminus" "Health checks (Terminus)" "terminus.md"
setSubSection_ "/recipes/documentation" "Documentation" "documentation.md"
setSubSection_ "/recipes/hot-reload" "Hot reload" "hot-reload.md"
setSubSection_ "/recipes/serve-static" "Serve static" "serve-static.md"

cd "${pTMP_content_}/faq"
setSection_ "" "FAQ" ""

setSubSection_ "/faq/http-adapter" "HTTP adapter" "http-adapter.md"
setSubSection_ "/faq/global-prefix" "Global path prefix" "global-prefix.md"
setSubSection_ "/faq/hybrid-application" "Hybrid application" "hybrid-application.md"
setSubSection_ "/faq/multiple-servers" "HTTPS &amp; multiple servers" "multiple-servers.md"
setSubSection_ "/faq/request-lifecycle" "Request lifecycle" "request-lifecycle.md"

cd "${pTMP_content_}/"
setSection_ "" "Migration guide" ""

setSubSection_ "/migration-guide" "Migration guide " "migration.md"

# cd "${pTMP_content_}"
# cd "${pTMP_content_}"
# cd "${pTMP_content_}/fundamentals"
# cd "${pTMP_content_}/techniques"
# cd "${pTMP_content_}/graphql"
# cd "${pTMP_content_}/websockets"
# cd "${pTMP_content_}/microservices"
# cd "${pTMP_content_}"
# cd "${pTMP_content_}/cli"
# cd "${pTMP_content_}/openapi"
# cd "${pTMP_content_}/recipes"
# cd "${pTMP_content_}/faq"
# cd "${pTMP_content_}/"

# cd "${pTMP_content_}"

# # setSection ### Introduction "- INT -- " "
# setSubSection_ introduction.md

# cd "${pTMP_content_}"

# ### Overview   "- OV -- " "
# setSubSection_ first-steps.md
# setSubSection_ controllers.md
# setSubSection_ components.md
# setSubSection_ modules.md
# setSubSection_ middlewares.md
# setSubSection_ exception-filters.md
# setSubSection_ pipes.md
# setSubSection_ guards.md
# setSubSection_ interceptors.md
# setSubSection_ custom-decorators.md

# cd "${pTMP_content_}/fundamentals"
# ### Fundamentals   "- FD -- " "
# setSubSection_ dependency-injection.md
# setSubSection_ async-components.md
# setSubSection_ dynamic-modules.md
# setSubSection_ provider-scopes.md
# setSubSection_ circular-dependency.md
# setSubSection_ module-reference.md
# setSubSection_ execution-context.md
# setSubSection_ lifecycle-events.md
# setSubSection_ platform-agnosticism.md
# setSubSection_ unit-testing.md

# cd "${pTMP_content_}/techniques"
# ### Techniques   "- TK -- " "
# setSubSection_ authentication.md
# setSubSection_ sql.md
# setSubSection_ mongo.md
# setSubSection_ configuration.md
# setSubSection_ validation.md
# setSubSection_ caching.md
# setSubSection_ serialization.md
# setSubSection_ task-scheduling.md
# setSubSection_ compression.md
# setSubSection_ security.md
# setSubSection_ queues.md
# setSubSection_ logger.md
# setSubSection_ file-upload.md
# setSubSection_ http-module.md
# setSubSection_ mvc.md
# setSubSection_ performance.md

# cd "${pTMP_content_}/graphql"
# ### Graphql   "- QL -- " "
# setSubSection_ quick-start.md
# setSubSection_ resolvers-map.md
# setSubSection_ mutations.md
# setSubSection_ subscriptions.md
# setSubSection_ scalars.md
# setSubSection_ directives.md
# setSubSection_ plugins.md
# setSubSection_ interfaces.md
# setSubSection_ unions.md
# setSubSection_ enums.md
# setSubSection_ mapped-types.md
# setSubSection_ complexity.md
# setSubSection_ extensions.md
# setSubSection_ cli-plugin.md
# setSubSection_ schema-generator.md
# setSubSection_ guards-interceptors.md
# setSubSection_ federation.md

# cd "${pTMP_content_}/websockets"
# ### Websockets   "- WS -- " "
# setSubSection_ gateways.md
# setSubSection_ exception-filters.md
# setSubSection_ pipes.md
# setSubSection_ guards.md
# setSubSection_ interceptors.md
# setSubSection_ adapter.md

# cd "${pTMP_content_}/microservices"
# ### Microservices   "- MS -- " "
# setSubSection_ basics.md
# setSubSection_ redis.md
# setSubSection_ mqtt.md
# setSubSection_ nats.md
# setSubSection_ rabbitmq.md
# setSubSection_ kafka.md
# setSubSection_ grpc.md
# setSubSection_ exception-filters.md
# setSubSection_ pipes.md
# setSubSection_ guards.md
# setSubSection_ interceptors.md

# cd "${pTMP_content_}"
# ### Standalone applications "- SA -- " "
# setSubSection_ application-context.md

# cd "${pTMP_content_}/cli"
# ### Cli   "- CLI -- " "
# setSubSection_ overview.md
# setSubSection_ workspaces.md
# setSubSection_ libraries.md
# setSubSection_ usages.md
# setSubSection_ scripts.md

# cd "${pTMP_content_}/openapi"
# ### Openapi   "- OAPI -- " "
# setSubSection_ introduction.md
# setSubSection_ types-and-parameters.md
# setSubSection_ operations.md
# setSubSection_ security.md
# setSubSection_ mapped-types.md
# setSubSection_ decorators.md
# setSubSection_ cli-plugin.md
# setSubSection_ other-features.md
# setSubSection_ migration-guide.md

# cd "${pTMP_content_}/recipes"
# ### Recipes   "- RC -- " "
# setSubSection_ sql-typeorm.md
# setSubSection_ mongodb.md
# setSubSection_ sql-sequelize.md
# # setSubSection_ # !!! OpenAPI section
# setSubSection_ cqrs.md
# setSubSection_ prisma.md
# setSubSection_ terminus.md
# setSubSection_ documentation.md
# setSubSection_ hot-reload.md
# setSubSection_ serve-static.md

# cd "${pTMP_content_}/faq"
# ### FAQ   "- FAQ -- " "
# setSubSection_ http-adapter.md
# setSubSection_ global-prefix.md
# setSubSection_ hybrid-application.md
# setSubSection_ multiple-servers.md
# setSubSection_ request-lifecycle.md

# cd "${pTMP_content_}/"
# ### Migration guide "- MG -- " "
# setSubSection_ migration.md

# "se href="https://docs.nestjs.com" ""
# ## Introduction
