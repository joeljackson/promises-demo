require 'rubygems'
require 'bundler'
require 'awesome_print'
require 'byebug'
require 'em-http-request'
require 'json'

Thread.new do
  EventMachine.run
end
sleep 0.5

request1 = EM::HttpRequest.new("http://localhost:4567/random1").get
request1.errback { p "something went wrong 1" }
request1.callback {
  if request1.response_header.status == 200
    random1 = JSON.parse(request1.response)["number"]
    request2 = EM::HttpRequest.new("http://localhost:4567/random1").get
    request2.errback { p "something went wrong 2" }
    request2.callback {
      if request2.response_header.status == 200
        random2 = JSON.parse(request2.response)["number"]
        request3 = EM::HttpRequest.new("http://localhost:4567/sum?one=#{random1}&two=#{random2}").get
        request3.errback { p "something went wrong 3" }
        request3.callback {
          p "#{random1} + #{random2} = #{JSON.parse(request3.response)["sum"]}"
        }
      else
        p "something went wrong 4"
      end
    }
  else
    p "something went wrong 5"
  end
}

while true
  sleep 10
end