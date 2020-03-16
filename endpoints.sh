#!/bin/bash

if [[ "$#" -lt 2 || "$1" == "-h" ]]; then
  echo "Usage: $0 [http_type] [dirs...]"
  exit 0
fi

for path in ${@:2}
do
	mkdir -p $path
	touch $path/$1.ftl

	cat <<- EOF > $path/$1.ftl
{

  <@lib.endpointInfo
      id = "ADD_ID"
      tag = "ADD_TAG"
      desc = "" />

  "parameters" : [

    <@lib.parameter
        name = "id"
        location = "path"
        type = "string"
        required = true
        last = true
        desc = "The id of the ADD_TYPE for which ENTER_DESC should be ADD_ACTION."/>
    <#assign last = true >
    <#include "/lib/commons/pagination-params.ftl" >

  ],

  <@lib.requestBody
      mediaType = "application/json"
      dto = "_Dto"
      examples = ['"example-1": {
                       "summary": "",
                       "description": "",
                       "value":
                     }'] />

  "responses" : {

    <@lib.response
        code = "200"
        dto = "ADD_DTO"
        array = true
        desc = "Request successful." />

    <@lib.response
        code = "400"
        dto = "ExceptionDto"
        last = true
        desc = "Bad Request. See the
                [Introduction](${docsUrl}/reference/rest/overview/#error-handling)
                for the error response format." />

  }
}
EOF
done

