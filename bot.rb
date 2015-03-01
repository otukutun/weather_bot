require 'twitter'
require 'rest_client'
require 'json'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_KEY']
  config.access_token_secret = ENV['ACCESS_SECRET']
end

#morioka
#forecast_json =  RestClient.get 'http://weather.livedoor.com/forecast/webservice/json/v1?city=030010'
#forecast = JSON.parse(forecast_json)
#forecast_morioka =  forecast["forecasts"][0]["telop"] + "で、最高気温は" + forecast["forecasts"][0]["temperature"]["max"]["celsius"] + "度"
#str = "今日の盛岡の天気は" + forecast_morioka + "です。"
#client.update str

#tokyo
forecast_json =  RestClient.get 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010'
forecast = JSON.parse(forecast_json)
forecast_tokyo =  forecast["forecasts"][0]["telop"] + "で、最高気温は" + forecast["forecasts"][0]["temperature"]["max"]["celsius"] + "度"
str = "今日の東京の天気は" + forecast_tokyo + "です。"
client.update str
