#!/bin/sh

snDATE=$(date +%y%m%d)
snDATEu=$(date --utc +%y%m%d)
snTIME=$(date +%H%M%S%Z)
snTIMEu=$(date --utc +%H%M%S%Z)
snEPOCH=$(date +%s)
snSTMP8=$(sha224hmac <<<$(date +%D%s%N) | cut -c -8 | tr \[a-z\] \[A-Z\])
snSTMP4a=$(sha224hmac <<<$(date +%A%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
snSTMP4b=$(sha224hmac <<<$(date +%B%s%N) | cut -c -4 | tr \[a-z\] \[A-Z\])
snSTMP8a="${snSTMP4a}-${snSTMP4b}"
pTMP_PATH="/tmp/docs.nestjs.com-${snapSTMP8a}"
pASSETS="${pTMP_PATH}/src/assets"
pCONTENT="${pTMP_PATH}/content"

git clone https://github.com/nestjs/docs.nestjs.com.git ${pTMP_PATH}
# gh repo clone nestjs/docs.nestjs.com ${pTMP_PATH}

mv ${pASSETS} ${pCONTENT}
rm -fr "${pCONTENT}/discover"
rm -fr "${pCONTENT}/recipes/swagger.md"

FILENAME_="../README.md"

echo "<!--" >${FILENAME_}
echo "This document is ´written´ by a proud Script Kiddy" >>${FILENAME_}
echo "" >>${FILENAME_}
echo "The document itself is under MIT License" >>${FILENAME_}
echo "Copyright © 2020 Benjamin Vincent (Luxcium)" >>${FILENAME_}
echo "" >>${FILENAME_}
echo "The documentation text contained in this document is" >>${FILENAME_}
echo "the work of Kamil Myśliwiec Copyright © 2017-2020 under MIT License" >>${FILENAME_}
echo "" >>${FILENAME_}
echo "(The MIT License)" >>${FILENAME_}
echo "" >>${FILENAME_}
echo "Copyright © 2017-2020 Kamil Myśliwiec <https://kamilmysliwiec.com> ― Docs Author" >>${FILENAME_}
echo "Copyright © 2020 Benjamin Vincent (Luxcium) ― Colligated Documentation Editror" >>${FILENAME_}
echo "" >>${FILENAME_}
echo "Permission is hereby granted, free of charge, to any person obtaining" >>${FILENAME_}
echo "a copy of this software and associated documentation files (the" >>${FILENAME_}
echo "'Software'), to deal in the Software without restriction, including" >>${FILENAME_}
echo "without limitation the rights to use, copy, modify, merge, publish," >>${FILENAME_}
echo "distribute, sublicense, and/or sell copies of the Software, and to" >>${FILENAME_}
echo "permit persons to whom the Software is furnished to do so, subject to" >>${FILENAME_}
echo "the following conditions:" >>${FILENAME_}
echo "" >>${FILENAME_}
echo "The above copyright notice and this permission notice shall be" >>${FILENAME_}
echo "included in all copies or substantial portions of the Software." >>${FILENAME_}
echo "" >>${FILENAME_}
echo "THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND," >>${FILENAME_}
echo "EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF" >>${FILENAME_}
echo "MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT." >>${FILENAME_}
echo "IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY" >>${FILENAME_}
echo "CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT," >>${FILENAME_}
echo "TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE" >>${FILENAME_}
echo "SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." >>${FILENAME_}
echo "-->" >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- START HEADER SECTION -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Header.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END HEADER SECTION -->" >>${FILENAME_}
echo "<!-- START SECTION Overview -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Overview.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Overview -->" >>${FILENAME_}
echo "<!-- START SECTION Fundamentals -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Fundamentals.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Fundamentals -->" >>${FILENAME_}
echo "<!-- START SECTION Techniques -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Techniques.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Techniques -->" >>${FILENAME_}
echo "<!-- START SECTION Graphql -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Graphql.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Graphql -->" >>${FILENAME_}
echo "<!-- START SECTION Websockets -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Websockets.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Websockets -->" >>${FILENAME_}
echo "<!-- START SECTION Microservices -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Microservices.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Microservices -->" >>${FILENAME_}
echo "<!-- START SECTION Cli -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Cli.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Cli -->" >>${FILENAME_}
echo "<!-- START SECTION Openapi -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Openapi.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Openapi -->" >>${FILENAME_}
echo "<!-- START SECTION Recipes -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Recipes.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Recipes -->" >>${FILENAME_}
echo "<!-- START SECTION Faq -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./Faq.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION Faq -->" >>${FILENAME_}
echo "<!-- START SECTION More -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ./More.md >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END SECTION More -->" >>${FILENAME_}
echo "<!-- START LICENSE SECTION -->" >>${FILENAME_}
echo "" >>${FILENAME_}
cat ../LICENSE >>${FILENAME_}
echo "" >>${FILENAME_}
echo "<!-- END LICENSE SECTION -->" >>${FILENAME_}

exit
