---
created_at: 2010-10-01
excerpt: Check your Gmail account using node.js
kind: article
publish: true
tags: [node.js]
title: "Check Gmail With Node.js"
_: ''
---

Learning `node.js` for reals.


I wasted about an hour figuring 
out how to securely connect to Gmail's unread email atom feed. The key piece 
is setting the `Authorization` header key to a base64 encoded
string with your authentication info.

    var http = require('http');

    var user = 'user@gmail.com';
    var password = 'password';
    var auth = new Buffer(user + ':' + password).toString('base64');

    var google = http.createClient(443, 'mail.google.com', true);
    var request = google.request('GET', '/mail/feed/atom/', {
        'Host': 'mail.google.com', 
        'Authorization': 'Basic ' + auth 
    });

    request.addListener('response', function(res) {
        var body = '';    
        res.addListener('data', function(chunk) { 
            body += chunk;
        });
        res.addListener('end', function() { 
            console.log(body); 
        });
    });

    request.end();


On a side note, I am working on a desktop customization tool for Ubuntu and
OS X built on `node.js` and WebKit. Make your desktop look awesome while
becoming awesome with `node.js`. Stay tuned.
