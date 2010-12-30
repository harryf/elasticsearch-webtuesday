#!/bin/sh
echo "Deleting index"
curl -XDELETE 'http://localhost:9200/techup/'

echo "\nCreating index"
curl -XPUT 'http://localhost:9200/techup/'

echo "\nApplying mapping"
curl -XPUT 'http://localhost:9200/techup/events/_mapping' -d '
{
    "events" : {
        "properties" : {
            "title" : { "type" : "string", "boost" : 2.0 },
            "summary" : { "type" : "string" },
            "updated" : { type: "date", "format" : "EEE, dd MMM yyyy HH:mm:ss Z" },
            "link" : { type: "string", "index" : "not_analyzed" }
        }
    }
}'
echo ""
