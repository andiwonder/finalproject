require "open-uri"
require 'pry'
require 'json'


file = File.open("item.json", "r")
data = file.read
parsedData = JSON.parse(data)




parsedData['itemdata'].each do |key, array|
  a =  array['img']
  File.open(a , 'wb') do |fo|
  	fo.write open("http://cdn.dota2.com/apps/dota2/images/items/" + a).read 
  end
end

		


# last3.each do |hero|
# 	a = item.


# end













