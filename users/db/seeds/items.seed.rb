@item_data = HTTParty.get("http://www.dota2.com/jsfeed/itemdata")

@item_data['itemdata'].each do |key , array|
	myobj = {
		id: array['id'],
		name: array['dname'],
		img_url: '/assets/item_pics/' + array['img'],
		cost: array['cost'],
		notes: array['notes'],
		lore: array['lore']
	}
	Item.create(id: myobj[:id],name: myobj[:name],img_url: myobj[:img_url], cost: myobj[:cost], notes: myobj[:notes],lore: myobj[:lore])
end
