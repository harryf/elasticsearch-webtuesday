#!/bin/sh
curl -XGET 'http://localhost:9200/techup/events/_search' -d @- <<EOF
{
    "query" : {
        "filtered" : {
            "query" : {
                "query_string" : {
                    "query" : "twitter"
                }
            },
            "filter" : {
                "script" : {
                    "script" : "doc['updated'].date.year < 2011"
                }
            }
        }
    },
    "sort" : [
        { "updated" : {"reverse" : true} },
        "_score"
    ],
    "fields" : ["title", "updated", "link"]
}
EOF
echo ""