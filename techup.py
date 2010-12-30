#!/usr/bin/env python
import httplib, hashlib, json
import feedparser

def index_event(e):
    """ Pass the event to ElasticSearch for indexing """
    id = hashlib.md5(e.link).hexdigest()
    body = json.dumps({'title': e.title, 'updated': e.updated,
                            'summary': e.summary, 'link': e.link})
    connection =  httplib.HTTPConnection('127.0.0.1:9200')
    connection.request('PUT', '/techup/events/' + id, body)
    # print connection.getresponse().read()
    

def get_events(feed):
    """ Parse the techup RSS feed """
    events = feedparser.parse(feed)
    
    for event in events.entries:
        index_event(event)

if __name__ == '__main__':
    get_events('http://rss.techup.ch/new-techup-events')
