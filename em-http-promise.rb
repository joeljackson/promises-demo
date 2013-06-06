require 'rubygems'
require 'bundler'
require 'awesome_print'
require 'em-promise'
require 'em-http-request'
require 'em-http-promise'
require 'json'

Thread.new do 
  EventMachine.run
end
sleep 0.5

random1 = random2 = 0

EM::Q.all(EM::HttpRequest.new("http://localhost:4567/random1").get,
  EM::HttpRequest.new("http://localhost:4567/random2").get).then{ |resp1, resp2|
  random1 = JSON.parse(resp1.response)["number"]
  random2 = JSON.parse(resp2.response)["number"]
  EM::HttpRequest.new("http://localhost:4567/sum?one=#{random1}&two=#{random2}").get
}.then(
  -> (resp) {
    p "#{random1} + #{random2} = #{JSON.parse(resp.response)["sum"]}"
  },
  -> (error) {
    p error
  }
)

while true
  sleep 10
end