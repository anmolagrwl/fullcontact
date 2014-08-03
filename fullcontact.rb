require 'rubygems'
require 'httparty'
require 'json'
# require "fullcontact"

api_key = "API_KEY" #Get the API from Fullcontact.com

# This could go in an initializer
# FullContact.configure do |config|
#     config.api_key = "API_KEY"
# end

# Get information about a email address
# person = FullContact.person(email: "bart@fullcontact.com")

# Get information about a twitter
# person2 = FullContact.person(twitter: "bartlorang")

# Get information about a twitter and ensure a 30s socket open timeout and a 15s socket read timeout
# Can throw a Faraday::Error::TimeoutError if timeouts are exceeded
# person3 = FullContact.person({:twitter => "bartlorang"}, {:request => {:timeout => 15, :open_timeout => 30}})

# Get person's family_name
# puts person.contact_info.family_name

puts "Lookup by:"
puts "1. Email"
puts "2. Phone"
puts "3. Twitter"
puts "4. Facebook"
print "Enter Number: "
lookup = gets.chomp.to_i

case lookup
when 1
	print "Enter Email: "
	email = gets.chomp
	response = HTTParty.get("https://api.fullcontact.com/v2/person.json?email=#{email}&apiKey=#{api_key}")

when 2 #phone lookup is highly experimental, as on website.
	print "Enter Phone Number: "
	phone = gets.chomp
	response = HTTParty.get("https://api.fullcontact.com/v2/person.json?phone=#{phone}&apiKey=#{api_key}")

when 3
	print "Enter Twitter ID: "
	twitter = gets.chomp
	response = HTTParty.get("https://api.fullcontact.com/v2/person.json?twitter=#{twitter}&apiKey=#{api_key}")

when 4
	print "Enter Facebook: "
	facebook = gets.chomp
	response = HTTParty.get("https://api.fullcontact.com/v2/person.json?facebookUsername=#{facebook}&apiKey=#{api_key}")
end

data = response.body
person = JSON.parse(data)

puts person


# NOTE: Take a look at webhookURL parameter in the documentation.