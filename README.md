# camunda-open-api-endpoints
Scripts to create the proper structure and FTL template files for the Camunda Open API spec

The `endpoints.sh` bash script has the following format:

```sh
./endpoints.sh [http_verb] [space_separated_enpoint_paths]
```

For example, the call to `./endpoints.sh get task/{id}/complete task/{id}/assign`
in a given directory, will produce the following folder structure:

* PARENT_DIRECTORY
  * task
    * {id}
      * complete
        * get.ftl
      * assign
        * get.ftl

The `\*.ftl` files listed above will contain the following content:
```xml
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
```