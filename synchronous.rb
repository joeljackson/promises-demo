require 'rubygems'
require 'bundler'
require 'awesome_print'
require 'byebug'
require 'json'
require 'net/http'

begin
  random1 = JSON.parse(Net::HTTP.get(URI("http://localhost:4567/random1")))["number"]
  random2 = JSON.parse(Net::HTTP.get(URI("http://localhost:4567/random2")))["number"]
  total = JSON.parse(Net::HTTP.get(URI("http://localhost:4567/sum?one=#{random1}&two=#{random2}")))["sum"]
  p "#{random1} + #{random2} = #{total}"
rescue Exception => error
  p error
end