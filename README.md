Code found in here was written for live demos as part of lightning talk
(well 15 minutes talk) delivered to [webtuesday in Jan 2011](http://techup.ch/98/webtuesday-zurich-lightning-talks).

The accompanying presentation can be [found here](https://docs.google.com/present/view?id=dcbkgbgf_132dpccntg5:).

The scripts used in the demo were used like this.

First part was showing how fast we could get up and running with elasticsearch
primed with real data, with the claim it could be in 60 seconds.

    $ ./60secs.sh

Downloads, extracts and starts elasticsearch.

    $ ./techup.py

Parsed the rss feed of http://techup.ch (which on the day of the talk, didn't have it's
own search engine) and HTTP PUT the docs into elastic search for indexing. Once done,
opened http://localhost:9200/techup/events/_search?q=web in browser to show we now have
a working search engine.

Second part was showing off elastic searches couchdb river. First stop elasticsearch
then run;

    $ ./couch_setup.sh

To install the couchdb river plugin for elastic search.

Next start a fresh instance of CouchDB ( used Couch.io for OS X ) then run

    $ ./couch_river.sh

...to create couchdb database, add two demo docs, configure couchdb river then open
the following URL in a browser;

http://localhost:9200/techup_couch/techup_couch/_search?q=_all:chuchi

Then switch back to CouchDB GUI, edit a document then refresh the URL to show the
update.

Finally demoed CouchDB clustering by starting a second instance on same machine with

    $ ./elasticsearch/bin/elasticsearch -f

...watching the logs to see master election and opening the following URLs to show
the cluster and that both nodes see the same index content;

* http://localhost:9200/_cluster/state?pretty=true - cluster state
* http://localhost:9200/techup/events/_search?q=java* - first node
* http://localhost:9201/techup/events/_search?q=java* - second node


