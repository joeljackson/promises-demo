require 'em-http-request'
require 'json'

Thread.new do 
  EventMachine.run
end
sleep 0.5

random1 = random2 = 0

EM::HttpRequest.new("http://localhost:4567/random1").get.then { |resp|
  random1 = JSON.parse(resp.response)["number"]
  EM::HttpRequest.new("http://localhost:4567/random2").get
}.then { |resp|
  random2 = JSON.parse(resp.response)["number"]
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