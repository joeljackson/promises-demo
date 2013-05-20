require 'em-http-request'
require 'em-promise'
require 'json'

Thread.new do 
  EventMachine.run
end
sleep 0.5

random1 = random2 = 0

EM::Q.all(EM::HttpRequest.new("http://www.google.com").get,
  EM::HttpRequest.new("http://www.google.com").get,
  EM::HttpRequest.new("http://www.google.com").get,
  EM::HttpRequest.new("http://www.google.com").get,
  EM::HttpRequest.new("http://www.google.com").get,
  EM::HttpRequest.new("http://www.google.com").get,
  EM::HttpRequest.new("http://www.google.com").get,
  EM::HttpRequest.new("http://www.google.com").get,
).then{ |answers|
  print "Hi"
}

while true
  sleep 10
end