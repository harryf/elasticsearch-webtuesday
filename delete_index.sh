#!/bin/sh
echo "Deleting index"
curl -XDELETE 'http://localhost:9200/techup/'
echo ""