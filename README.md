promises-demo
=============

A quick demo of js promises

See public/promises.js

Run the ruby server via `ruby app.rb`. It implements two urls that return random numbers and one that adds up numbers. (/random1, /random2, /sum)

Go to localhost:4567/ajax.html to see /public/ajax.js in action. It is a normal, non promise implementation of grabbing two numbers from the server and adding them up.

Check localhost:4567/index.html to see /public/promises.js in action. Same thing, but looking much nicer with promises.

Lastly see em-http-promise.rb in action using promises in ruby. `ruby em-http-promise.rb`
It requires the code from this pull request: https://github.com/igrigorik/em-http-request/pull/233


