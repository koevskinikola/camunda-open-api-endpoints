#!/bin/bash

if [[ "$#" -ne 2 || "$1" == "-h" ]]; then
  echo "Usage: $0 [resource_name] [path]"
  exit 0
fi

mkdir -p $2
touch $2/$1.ftl

cat <<- EOF > $2/$1.ftl
{
  "type": "object",
  "properties": {

    <@lib.property
        name = "id"
        type = "string"
        desc = "The id of the RESOURCE." />

    <@lib.property
        name = "PROPERTY_NAME"
        type = "boolean"
        desc = "" />

    <@lib.property
        name = "PROPERTY_NAME"
        type = "string"
        format = "date-time"
        desc = "[Default format](${docsUrl}/reference/rest/overview/date-format/)" />

    <@lib.property
        name = "PROPERTY_NAME"
        type = "string"
        format = "int32"
        desc = "" />

	<@lib.property
        name = "PROPERTY_NAME"
        type = "string"
        format = "int64"
        desc = "" />

	<@lib.property
        name = "PROPERTY_NAME"
        type = "string"
        format = "binary"
        desc = "" />

    <@lib.property
        name = "links"
        type = "array"
        dto = "_Dto"
        last = true
        desc = "" />

  }
}
EOF
