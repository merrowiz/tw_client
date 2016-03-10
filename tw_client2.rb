require "twitter"
require "./token.rb"
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = Token::CONSUMER_KEY
  config.consumer_secret     = Token::CONSUMER_SECRET
  config.access_token        = Token::ACCESS_TOKEN
  config.access_token_secret = Token::ACCESS_TOKEN_SECRET
end



if ARGV[0] == "tweet"
	client.update ARGV[1]
	puts "Your post secceeded."

elsif ARGV[0] == "timeline"
	puts "TimeLine"
	client.home_timeline.each do |tweet|
	   puts tweet.full_text
	    puts "Fav: #{tweet.favorite_count}, Retweet: #{tweet.retweet_count}"
	end
end

