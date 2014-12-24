#!/usr/bin/env ruby

require 'twitter'
require 'rest_client'
require 'json'

Chatroid.new do |config|
  set :service, 'Twitter'
  set :consumer_key, ENV['CONSUMER_KEY']
  set :consumer_secret, ENV['CONSUMER_SECRET']
  set :oauth_token, ENV['ACCESS_KEY']
  set :oauth_token_secret, ENV['ACCESS_SECRET']

  on_time :hour => 7, :min => 0, :sec => 0 do
    forecast_json =  RestClient.get 'http://weather.livedoor.com/forecast/webservice/json/v1?city=030010'
    forecast = JSON.parse(forecast_json)
    forecast_morioka =  forecast["forecasts"][0]["telop"] + "で、最高気温は" + forecast["forecasts"][0]["temperature"]["max"]["celsius"] + "度"
    str = "今日の盛岡の天気は" + forecast_morioka + "です。"
    tweet str
  end
end.run!
