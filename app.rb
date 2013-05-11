require 'sinatra'
require 'json'

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/random1' do
  content_type :json
  halt 404 if rand(10) > 8
  {
    number: rand(10)
  }.to_json
end

get '/random2' do
  content_type :json
  halt 404 if rand(10) > 8
  {
    number: rand(10)
  }.to_json
end

get '/sum' do
  content_type :json
  halt 404 if rand(10) > 8
  {
    sum: params[:one].to_i + params[:two].to_i
  }.to_json
end