#!/bin/sh

# create a couchdb database
curl -XPUT 'http://localhost:5984/techup_couch'

# put some documents in it
curl -X PUT http://127.0.0.1:5984/techup_couch/1 -d '
    {
        "title":"webtuesday february",
        "summary":"which came first - the chicken or the egg?"
    }
'

curl -X PUT http://127.0.0.1:5984/techup_couch/2 -d '
    {
        "title":"UX Chuchi",
        "summary":"where we make newsite.ch feel terrible"
    }
'

curl -XPUT 'http://localhost:9200/_river/techup_couch/_meta' -d '{
    "type" : "couchdb",
    "couchdb" : {
        "host" : "localhost",
        "port" : 5984,
        "db" : "techup_couch",
        "filter" : null
    }
}'
echo ""