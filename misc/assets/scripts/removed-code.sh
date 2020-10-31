#!/bin/sh

#!/bin/sh

source /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/cat-functions.sh

pTMP_PATH="/tmp/docs.nestjs.com-$(getSTMP8a)"
pTMP_PATH_flags="${pTMP_PATH}/flags-$(getSTMP4)"

gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}
cp -r /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/ ${pTMP_PATH}/content
cd ${pTMP_PATH}/content
mkdir build

flg_sec_top="${pTMP_PATH_flags}/sec_top.txt"
flg_sec_previous="${pTMP_PATH_flags}/sec_previous.txt"
flg_sec_current="${pTMP_PATH_flags}/sec_current.txt"
flg_sec_next="${pTMP_PATH_flags}/sec_next.txt"

flg_sub_top="${pTMP_PATH_flags}/sub_top.txt"
flg_sub_previous="${pTMP_PATH_flags}/sub_previous.txt"
flg_sub_current="${pTMP_PATH_flags}/sub_current.txt"
flg_sub_next="${pTMP_PATH_flags}/sub_next.txt"

touch "${flg_sec_top}"
touch "${flg_sec_previous}"
touch "${flg_sec_current}"
touch "${flg_sec_next}"
touch "${flg_sub_top}"
touch "${flg_sub_previous}"
touch "${flg_sub_current}"
touch "${flg_sub_next}"

source /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/flags-functions.sh

pTMP_content_="${pTMP_PATH}/content"

# pTMP_content_="${pTMP_PATH}/content"
long_Url_="https://docs.nestjs.com/"
randy001=some-8FA9-9265x.md

function _create_section() {
  _imgwidth=${_imgwidth2}
  _anchorid_current="${_anchorid_current}"
  _anchorid_top="${_anchorid_current}"
  _anchorid_previous="${_anchorid_current}"
  _anchorid_next="${_anchorid_current}"
  echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) ${_sectionText} $(imagetag_chevrons_up)
}

function _create_sub_section() {
  _imgwidth=${_imgwidth3}
  _anchorid_current="${_subanchorid_current}"
  _anchorid_top="${_subanchorid_current}"
  _anchorid_previous="${_subanchorid_current}"
  _anchorid_next="${_subanchorid_current}"
  echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) ${_sectionText} $(imagetag_logo_small) $(imagetag_chevron_up)
}

function setSection_() {
  short_Url="${1}"
  _sectionText="${2}"
  _sectionanchorid_top="top"
  _sectionanchorid_previous="${_sectionanchorid_current}"
  _sectionanchorid_current="${_sectionanchorid_next}"
  _sectionanchorid_next="$(getSTMP8)"
  _imgwidth=${_imgwidth3}
  echo $(_create_section) >>/home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/some-${randy001}.md
}

function setSubSection_() {
  short_Url="${1}"
  _sectionText="${2}"
  _subanchorid_top="${_sectionanchorid_current}"
  _subanchorid_previous="${_subanchorid_current}"
  _subanchorid_current="${_subanchorid_next}"
  _subanchorid_next="$(getSTMP8)"
  _imgwidth=${_imgwidth3}
  echo $(_create_sub_section) >>/home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/some-${randy001}.md
}
echo "" >/home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/some-${randy001}.md
cd "${pTMP_content_}"
setSection_ "" "Introduction" ""
setSubSection_ "/" "Introduction" "introduction.md"

cd "${pTMP_content_}"
setSection_ "" "Overview" ""
# -------------------------------------------------------------
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
# -------------------------------------------------------------
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

cd "${pTMP_content_}/graphql"
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

cd "${pTMP_content_}/websockets"
setSection_ "" "Websockets" ""
# -------------------------------------------------------------
setSubSection_ "/websockets/gateways" "Gateways" "gateways.md"
setSubSection_ "/websockets/exception-filters" "Exception filters" "exception-filters.md"
setSubSection_ "/websockets/pipes" "Pipes" "pipes.md"
setSubSection_ "/websockets/guards" "Guards" "guards.md"
setSubSection_ "/websockets/interceptors" "Interceptors" "interceptors.md"
setSubSection_ "/websockets/adapter" "Adapters" "adapter.md"

cd "${pTMP_content_}/microservices"
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

cd "${pTMP_content_}"
setSection_ "" "Standalone applications" ""
# -------------------------------------------------------------
setSubSection_ "/standalone-applications" "Standalone Apps" "application-context.md"

cd "${pTMP_content_}/cli"
setSection_ "" "Cli" ""
# -------------------------------------------------------------
setSubSection_ "/cli/overview" "Overview" "overview.md"
setSubSection_ "/cli/monorepo" "Workspaces" "workspaces.md"
setSubSection_ "/cli/libraries" "Libraries" "libraries.md"
setSubSection_ "/cli/usages" "Usage" "usages.md"
setSubSection_ "/cli/scripts" "Scripts" "scripts.md"

cd "${pTMP_content_}/openapi"
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

cd "${pTMP_content_}/recipes"
setSection_ "" "Recipes" ""
# -------------------------------------------------------------
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
# -------------------------------------------------------------
setSubSection_ "/faq/http-adapter" "HTTP adapter" "http-adapter.md"
setSubSection_ "/faq/global-prefix" "Global path prefix" "global-prefix.md"
setSubSection_ "/faq/hybrid-application" "Hybrid application" "hybrid-application.md"
setSubSection_ "/faq/multiple-servers" "HTTPS &amp; multiple servers" "multiple-servers.md"
setSubSection_ "/faq/request-lifecycle" "Request lifecycle" "request-lifecycle.md"

cd "${pTMP_content_}/"
setSection_ "" "Migration guide" ""
# -------------------------------------------------------------
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

exit



# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="_imgwidth"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
function imagetag_() {
  echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"
}

_anchorpage=""
_anchorid=""
function imganchortag_() {
  _anchorinner="$(imagetag_)"
  _anchorhash="#${_anchorid}"
  echo -n "<a href='${_anchorpage}${_anchorhash}'>${_anchorinner}</a>"
}
# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

function imagetag_logo-small() {
  _imgsrc="${_logosmall}"
  _imgalt="Nest JS Small Logo"
  imganchortag_
}
function imagetag_chevrons_up() {
  _imgsrc="${_icon1up}"
  _imgalt="Go top"
  imganchortag_
}
function imagetag_chevrons_left() {
  _imgsrc="${_icon1lft}"
  _imgalt="Previous section"
  imganchortag_
}
function imagetag_chevrons_right() {
  _imgsrc="${_icon1rgh}"
  _imgalt="Next section"
  imganchortag_
}
function imagetag_chevron_up() {
  _imgsrc="${_icon2up}"
  _imgalt="Go top section"
  imganchortag_
}
function imagetag_chevron_left() {
  _imgsrc="${_icon2lft}"
  _imgalt="Previous sub-section"
  imganchortag_
}
function imagetag_chevron_right() {
  _imgsrc="${_icon2rgh}"
  _imgalt="Next sub-section"
  imganchortag_
}

function _create_section() {
  echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
}

function _create_sub-section() {
  echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

}

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}
# gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

mv ${pASSETS} ${pCONTENT}
rm -fr "${pCONTENT}/discover"
rm -fr "${pCONTENT}/recipes/swagger.md"

FILENAME_="../README.md"

_imgsrc="_imgsrc"
_imgwidth="20"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
function _create_section() {
  echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
}
## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="15"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
function _create_sub-section() {
  echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

}
### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# echo "-->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Header.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Overview.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# imagetag_chevron_right
_imgpath="./content/assets/svg"
echo ""
echo ""
echo ""
# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="20"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
_create_section
echo ""
echo ""
echo ""
# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="15"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
_create_sub-section
echo ""
echo ""
echo ""


#!/bin/sh

snDATE=$(date +%y%m%d)
snDATEu=$(date --utc +%y%m%d)
snTIME=$(date +%H%M%S%Z)
snTIMEu=$(date --utc +%H%M%S%Z)
snEPOCH=$(date +%s)
snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
pASSETS="${pTMP_PATH}/src/assets"
pCONTENT="${pTMP_PATH}/content"

sect1_="# "
sect2_="## "
sect3_="### "
sect4_="#### "

_imgwidth1=30
_imgwidth2=25
_imgwidth3=20

function getSTMP8() {
  echo -n Z$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])x
}

function getSTMP4() {
  echo -n $(sha224hmac <<<$(date +%D%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
}

function getSTMP6() {
  echo -n \#$(sha224hmac <<<$(date +%D%s%N) | cut -c -6 | tr \[a-z\] \[A-Z\])
}

_innerspawn="."
function getRandomSpan() {
  echo -n "<span style='color:$(getSTMP6)'> ${_innerspawn} </span>"
}

function getSTMP8a() {
  echo -n "$(getSTMP4)-$(getSTMP4)x"

}

pTMP_PATH="/tmp/docs.nestjs.com-$(getSTMP8a)"

_imgpath="../svg"
_iconpath="../svg"

_logosmall="/logo-small.svg"

_icon1up="/chevrons-up.svg"
_icon1lft="/chevrons-left.svg"
_icon1rgh="/chevrons-right.svg"

_icon2up="/chevron-up.svg"
_icon2lft="/chevron-left.svg"
_icon2rgh="/chevron-right.svg"

function imagetag_() {
  echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='${_imgid}' />"
}

function imganchortag_() {
  _anchorinner="$(imagetag_)"
  _anchorhash="#${_anchorid}"
  echo -n "<a href='${_anchorpage}${_anchorhash}'>${_anchorinner}</a>"
}

function imagetag_logo_small() {
  _imgid=$(getSTMP8)
  _imgsrc="${_logosmall}"
  _anchorid="top"
  _imgalt="Nest JS Small Logo"
  _anchorpage="${long_Url_}${short_Url}"
  imganchortag_
}

function imagetag_chevrons_up() {
  _imgsrc="${_icon1up}"
  _imgid="${_anchorid_current}"
  _imgalt="Go to top"
  imganchortag_
}

function imagetag_chevrons_left() {
  _imgid=$(getSTMP8)
  _imgsrc="${_icon1lft}"
  _imgalt="Previous section"
  imganchortag_
}

function imagetag_chevrons_right() {
  _imgid=$(getSTMP8)
  _imgsrc="${_icon1rgh}"
  _imgalt="Next section"
  imganchortag_
}

function imagetag_chevron_up() {
  _imgsrc="${_icon2up}"
  _imgid="${_anchorid_current}"
  _imgalt="Go to top section"
  _anchorid=${_anchorid_top}
  imganchortag_
}

function imagetag_chevron_left() {
  _imgid=$(getSTMP8)
  _imgsrc="${_icon2lft}"
  _imgalt="Previous sub-section"
  _anchorid=${_anchorid_previous}
  imganchortag_
}

function imagetag_chevron_right() {
  _imgid=$(getSTMP8)
  _imgsrc="${_icon2rgh}"
  _imgalt="Next sub-section"
  _anchorid=${_anchorid_next}
  imganchortag_
}

# _create_sub_section
# _imgpath
# _imgsrc
# _imgwidth
# _imgalt
# _imgidtype
# _imgid
# _anchorid
# _anchorpage
# _anchorhash
# _anchorinner
# _logosmall
# _icon1up
# _icon1lft
# _icon1rgh
# _icon2up
# _icon2lft
# _icon2rgh
# sect2_
# sect3_

# imagetag_
# imagetag_chevrons_left
# imagetag_chevrons_right
# imagetag_chevrons_up
# imagetag_logo_small
# imagetag_chevron_left
# imagetag_chevron_right
# imagetag_chevron_up

# echo ""
# echo ""
# getSTMP8
# echo ""
# getSTMP8a
# echo ""
# getSTMP4
# echo ""
# getSTMP6
# echo ""
# snapSTMP8a="$(getSTMP8a)"

#+ ################################ source "./cat-functions.sh"
#+ ################################ source "./cat-functions.sh"
#+ ################################ source "./cat-functions.sh"
#+ ################################ source "./cat-functions.sh"

# function imagetag_() {
#   echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"
# }

# _anchorpage=""
# _anchorid=""
# function imganchortag_() {
#   _anchorinner="$(imagetag_)"
#   _anchorhash="#${_anchorid}"
#   echo -n "<a href='${_anchorpage}${_anchorhash}'>${_anchorinner}</a>"
# }

# function imagetag_logo-small() {
#   _imgsrc="${_logosmall}"
#   _imgalt="Nest JS Small Logo"
#   imganchortag_
# }

# function imagetag_chevrons_up() {
#   _imgsrc="${_icon1up}"
#   _imgalt="Go top"
#   imganchortag_
# }

# function imagetag_chevrons_left() {
#   _imgsrc="${_icon1lft}"
#   _imgalt="Previous section"
#   imganchortag_
# }

# function imagetag_chevrons_right() {
#   _imgsrc="${_icon1rgh}"
#   _imgalt="Next section"
#   imganchortag_
# }

# function imagetag_chevron_up() {
#   _imgsrc="${_icon2up}"
#   _imgalt="Go top section"
#   imganchortag_
# }

# function imagetag_chevron_left() {
#   _imgsrc="${_icon2lft}"
#   _imgalt="Previous sub-section"
#   imganchortag_
# }

# function imagetag_chevron_right() {
#   _imgsrc="${_icon2rgh}"
#   _imgalt="Next sub-section"
#   imganchortag_
# }

# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }

# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }

# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }
# ## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }
### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# echo "-->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Header.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Overview.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# imagetag_chevron_right
_imgpath="./content/assets/svg"
echo ""
echo ""
echo ""
# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="20"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
_create_section
echo ""
echo ""
echo ""
# _imgpath="_imgpath"
_imgsrc="_imgsrc"
_imgwidth="15"
_imgalt="_imgalt"
_imgid="_imgid"
_imgidtype="_imgidtype"
_anchorpage=""
_anchorid=""
_create_sub-section
echo ""
echo ""
echo ""

# snDATE=$(date +%y%m%d)
# snDATEu=$(date --utc +%y%m%d)
# snTIME=$(date +%H%M%S%Z)
# snTIMEu=$(date --utc +%H%M%S%Z)
# snEPOCH=$(date +%s)
# snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
# snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
# pTMP_PATH="/tmp/docs.nestjs.com-${snapSTMP8a}"
# pASSETS="${pTMP_PATH}/src/assets"
# pCONTENT="${pTMP_PATH}/content"

# _width1=15
# _width2=20
# _width3=25

# _imgpath="./content/assets/svg/"
# _iconpath="./content/assets/svg/"

# _logosmall="/logo-small.svg"

# _icon1up="/chevrons-up.svg"
# _icon1lft="/chevrons-left.svg"
# _icon1rgh="/chevrons-right.svg"

# _icon2up="/chevron-up.svg"
# _icon2lft="/chevron-left.svg"
# _icon2rgh="/chevron-right.svg"

# sect1_="# "
# sect2_="## "
# sect3_="### "
# sect4_="#### "

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="_imgwidth"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

# git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}
# # gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

# mv ${pASSETS} ${pCONTENT}
# rm -fr "${pCONTENT}/discover"
# rm -fr "${pCONTENT}/recipes/swagger.md"

# FILENAME_="../README.md"

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

# git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}
# # gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

# mv ${pASSETS} ${pCONTENT}
# rm -fr "${pCONTENT}/discover"
# rm -fr "${pCONTENT}/recipes/swagger.md"

# FILENAME_="../README.md"

# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }
# ## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }
# ### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# # echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# # echo "-->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # cat ./Header.md >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# # echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # cat ./Overview.md >>${FILENAME_}
# # echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# imagetag_chevron_right
# _imgpath="./content/assets/svg"
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_section
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_sub-section
# echo ""
# echo ""
# echo ""

# snDATE=$(date +%y%m%d)
# snDATEu=$(date --utc +%y%m%d)
# snTIME=$(date +%H%M%S%Z)
# snTIMEu=$(date --utc +%H%M%S%Z)
# snEPOCH=$(date +%s)
# snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
# snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
# pTMP_PATH="/tmp/docs.nestjs.com-${snapSTMP8a}"
# pASSETS="${pTMP_PATH}/src/assets"
# pCONTENT="${pTMP_PATH}/content"

# _width1=15
# _width2=20
# _width3=25

# _imgpath="./content/assets/svg/"
# _iconpath="./content/assets/svg/"

# _logosmall="/logo-small.svg"

# _icon1up="/chevrons-up.svg"
# _icon1lft="/chevrons-left.svg"
# _icon1rgh="/chevrons-right.svg"

# _icon2up="/chevron-up.svg"
# _icon2lft="/chevron-left.svg"
# _icon2rgh="/chevron-right.svg"

# sect1_="# "
# sect2_="## "
# sect3_="### "
# sect4_="#### "

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="_imgwidth"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"


#!/bin/zsh

cd /home/luxcium/.local/src/nestjs-colligated-docs
source /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/cat-functions.sh

pTMP_PATH="/tmp/docs.nestjs.com-$(getSTMP8a)"
pTMP_content_="${pTMP_PATH}/content"

gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH} # && cd ${pTMP_PATH}/content/
cp -r /home/luxcium/.local/src/nestjs-colligated-docs/misc/assets/scripts/ ${pTMP_PATH}/content
cd ${pTMP_PATH}/content
mkdir build

pwd
lf

# git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}

# source "./cat-functions.sh"

# function imagetag_() {
#   echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"
# }

# _anchorpage=""
# _anchorid=""
# function imganchortag_() {
#   _anchorinner="$(imagetag_)"
#   _anchorhash="#${_anchorid}"
#   echo -n "<a href='${_anchorpage}${_anchorhash}'>${_anchorinner}</a>"
# }

# function imagetag_logo-small() {
#   _imgsrc="${_logosmall}"
#   _imgalt="Nest JS Small Logo"
#   imganchortag_
# }

# function imagetag_chevrons_up() {
#   _imgsrc="${_icon1up}"
#   _imgalt="Go top"
#   imganchortag_
# }

# function imagetag_chevrons_left() {
#   _imgsrc="${_icon1lft}"
#   _imgalt="Previous section"
#   imganchortag_
# }

# function imagetag_chevrons_right() {
#   _imgsrc="${_icon1rgh}"
#   _imgalt="Next section"
#   imganchortag_
# }

# function imagetag_chevron_up() {
#   _imgsrc="${_icon2up}"
#   _imgalt="Go top section"
#   imganchortag_
# }

# function imagetag_chevron_left() {
#   _imgsrc="${_icon2lft}"
#   _imgalt="Previous sub-section"
#   imganchortag_
# }

# function imagetag_chevron_right() {
#   _imgsrc="${_icon2rgh}"
#   _imgalt="Next sub-section"
#   imganchortag_
# }

# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }

# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }

# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }
# ## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }
### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# echo "-->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Header.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Overview.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# # imagetag_chevron_right
# _imgpath="./content/assets/svg"
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_section
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_sub-section
# echo ""
# echo ""
# echo ""

# snDATE=$(date +%y%m%d)
# snDATEu=$(date --utc +%y%m%d)
# snTIME=$(date +%H%M%S%Z)
# snTIMEu=$(date --utc +%H%M%S%Z)
# snEPOCH=$(date +%s)
# snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
# snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
# pTMP_PATH="/tmp/docs.nestjs.com-${snapSTMP8a}"
# pASSETS="${pTMP_PATH}/src/assets"
# pCONTENT="${pTMP_PATH}/content"

# _width1=15
# _width2=20
# _width3=25

# _imgpath="./content/assets/svg/"
# _iconpath="./content/assets/svg/"

# _logosmall="/logo-small.svg"

# _icon1up="/chevrons-up.svg"
# _icon1lft="/chevrons-left.svg"
# _icon1rgh="/chevrons-right.svg"

# _icon2up="/chevron-up.svg"
# _icon2lft="/chevron-left.svg"
# _icon2rgh="/chevron-right.svg"

# sect1_="# "
# sect2_="## "
# sect3_="### "
# sect4_="#### "

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="_imgwidth"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

# mv ${pASSETS} ${pCONTENT}
# rm -fr "${pCONTENT}/discover"
# rm -fr "${pCONTENT}/recipes/swagger.md"

# FILENAME_="../README.md"

# _imgpath=""
# _imgwidth=""
# _anchorpage=""

# _imgid=""
# _anchorid=""

# git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}
# # gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

# mv ${pASSETS} ${pCONTENT}
# rm -fr "${pCONTENT}/discover"
# rm -fr "${pCONTENT}/recipes/swagger.md"

# FILENAME_="../README.md"

# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_section() {
#   echo -n ${sect2_}$(imagetag_chevrons_left)$(imagetag_chevrons_right) $(imagetag_chevrons_up) $(imagetag_logo-small)
# }
# ## <a href='#'><img src='_imgpath/chevrons-left.svg' width='_imgwidth' alt='Previous section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevrons-right.svg' width='_imgwidth' alt='Next section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevrons-up.svg' width='_imgwidth' alt='Go top' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# function _create_sub-section() {
#   echo -n ${sect3_}$(imagetag_chevron_left)$(imagetag_chevron_right) $(imagetag_chevron_up) $(imagetag_logo-small)

# }
# ### <a href='#'><img src='_imgpath/chevron-left.svg' width='_imgwidth' alt='Previous sub-section' id='imagetag__imgidtype-_imgid' /></a><a href='#'><img src='_imgpath/chevron-right.svg' width='_imgwidth' alt='Next sub-section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/chevron-up.svg' width='_imgwidth' alt='Go top section' id='imagetag__imgidtype-_imgid' /></a> <a href='#'><img src='_imgpath/logo-small.svg' width='_imgwidth' alt='Nest JS Small Logo' id='imagetag__imgidtype-_imgid' /></a>

# # echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# # echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"

# # echo "-->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # cat ./Header.md >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
# # echo "<!-- START SECTION Overview -->" >>${FILENAME_}
# # echo "" >>${FILENAME_}
# # cat ./Overview.md >>${FILENAME_}
# # echo "" >>${FILENAME_}
# echo "<!-- END SECTION Overview -->" >>${FILENAME_}
# echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Fundamentals.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
# echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Techniques.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
# echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Graphql.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
# echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Websockets.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
# echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Microservices.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
# echo "<!-- START SECTION Cli -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Cli.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Cli -->" >>${FILENAME_}
# echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Openapi.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
# echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Recipes.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
# echo "<!-- START SECTION Faq -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./Faq.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION Faq -->" >>${FILENAME_}
# echo "<!-- START SECTION More -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ./More.md >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END SECTION More -->" >>${FILENAME_}
# echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
# echo "" >>${FILENAME_}
# cat ../LICENSE >>${FILENAME_}
# echo "" >>${FILENAME_}
# echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

# exit

# imagetag_
# echo ""
# imganchortag_
# echo ""
# imagetag_logo-small
# echo ""
# imagetag_chevrons_up
# echo ""
# imagetag_chevrons_left
# echo ""
# imagetag_chevrons_right
# echo ""
# imagetag_chevron_up
# echo ""
# imagetag_chevron_left
# echo ""
# imagetag_chevron_right
# _imgpath="./content/assets/svg"
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="20"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_section
# echo ""
# echo ""
# echo ""
# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="15"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""
# _create_sub-section
# echo ""
# echo ""
# echo ""

# snDATE=$(date +%y%m%d)
# snDATEu=$(date --utc +%y%m%d)
# snTIME=$(date +%H%M%S%Z)
# snTIMEu=$(date --utc +%H%M%S%Z)
# snEPOCH=$(date +%s)
# snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
# snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
# snapSTMP8a="${snSTMP4a}-${snSTMP4b}"
# pTMP_PATH="/tmp/docs.nestjs.com-${snapSTMP8a}"
# pASSETS="${pTMP_PATH}/src/assets"
# pCONTENT="${pTMP_PATH}/content"

# _width1=15
# _width2=20
# _width3=25

# _imgpath="./content/assets/svg/"
# _iconpath="./content/assets/svg/"

# _logosmall="/logo-small.svg"

# _icon1up="/chevrons-up.svg"
# _icon1lft="/chevrons-left.svg"
# _icon1rgh="/chevrons-right.svg"

# _icon2up="/chevron-up.svg"
# _icon2lft="/chevron-left.svg"
# _icon2rgh="/chevron-right.svg"

# sect1_="# "
# sect2_="## "
# sect3_="### "
# sect4_="#### "

# # _imgpath="_imgpath"
# _imgsrc="_imgsrc"
# _imgwidth="_imgwidth"
# _imgalt="_imgalt"
# _imgid="_imgid"
# _imgidtype="_imgidtype"
# _anchorpage=""
# _anchorid=""

# echo -n "<a href='${_anchorpage}#${_anchorid}'>$(echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}'/>")</a>"
# echo -n "<img src='${_imgpath}${_imgsrc}' width='${_imgwidth}' alt='${_imgalt}' id='imagetag_${_imgidtype}-${_imgid}' />"
