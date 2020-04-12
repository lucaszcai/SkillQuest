import flask
from flask import request
from flask import jsonify

# Initialize the app
from selenium import webdriver
#import qgrid
import numpy as np
import pandas as pd
import random
import json

app = flask.Flask(__name__)

# An example of routing:
# If they go to the page "/" (this means a GET request
# to the page http://127.0.0.1:5000/), return a simple
# page that says the site is up!
from bs4 import BeautifulSoup
import urllib
import re

def search(query):
    address = "http://www.bing.com/search?q=%s" % (urllib.parse.quote_plus(query)+"&count=30")

    getRequest = urllib.request.Request(address, None, {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0'})

    urlfile = urllib.request.urlopen(getRequest)
    htmlResult = urlfile.read(2000000)
    urlfile.close()

    soup = BeautifulSoup(htmlResult)

    [s.extract() for s in soup('span')]
    unwantedTags = ['a', 'strong', 'cite']

    for tag in unwantedTags:
        for match in soup.findAll(tag):
            match.replaceWithChildren()

    results = soup.findAll('li', { "class" : "b_algo" })

    return results
    
def get_skill_info(skill):
    links = search('How to '+skill)
    titles = []
    urls = []
    print(links[1])
    response = []
    for link in links :
        r = {}
        r['url']= str(link.find('div', class_ = 'b_attribution').text).replace(" ", " ")
        r['title']= str(link.find('h2').text).replace(" ", " ")
        response.append(r)
    answer = {}
    answer['body'] = response
    return answer
        
@app.route("/skill/", methods=["GET"])
def get_skill():
    skill = request.args['skill']
    return get_skill_info(skill)


# Start the server, continuously listen to requests.

if __name__=="__main__":
    # For local development:
    #app.run(debug=True)
    # For public web serving:
    app.run(host='0.0.0.0', port=8080, debug=True)
