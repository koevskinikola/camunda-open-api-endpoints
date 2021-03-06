#!/bin/bash

if [[ "$#" -lt 2 || "$1" == "-h" ]]; then
  echo "Usage: $0 [http_type] [dirs...]"
  exit 0
fi

for url in ${@:2}
do
	mkdir -p $url
	touch $url/$1.ftl

	cat <<- EOF > $url/$1.ftl
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
        desc = ""/>

    <#assign last = true >
    <#include "/lib/commons/pagination-params.ftl" >

  ],

  <@lib.requestBody
      mediaType = "application/json"
      dto = "_Dto"
      examples = ['"example-1": {
                       "summary": "",
                       "description": "",
                       "value": ""
                     }'] />

  "responses" : {

    <@lib.response
        code = "200"
        dto = "ADD_DTO"
        array = true
        desc = "Request successful."
        examples = ['"example-1": {
                       "summary": "",
                       "description": "",
                       "value": ""
                     }'] />

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

