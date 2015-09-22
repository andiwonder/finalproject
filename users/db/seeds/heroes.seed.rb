

# am = Champion.create(hero_name: 'antimage', img_url: '/assets/hero_pics/antimage.png',roles: 'Carry - Escape - Nuker',char_type: 'agi')
count = 0

@hero_data = HTTParty.get("http://www.dota2.com/jsfeed/heropediadata?feeds=herodata&l=english")
@real_hero_data = HTTParty.get("https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&language=en_us")

# puts @hero_data['herodata']['axe']


@real_hero_data['result']['heroes'].each do |hero|
	x = hero['name'].gsub("npc_dota_hero_","")
	y = @hero_data['herodata'][x]
	myobj = {
		id: hero['id'],
		hero_name: x,
		img_url: '/assets/hero_pics/' + x +'.png',
		roles: y['droles'],
		char_type: y['pa']
	}
	Champion.create(id: myobj[:id], hero_name: myobj[:hero_name],img_url: myobj[:img_url],roles: myobj[:roles],char_type: myobj[:char_type])
	
end

# @hero_data['herodata'].each do |key , value|
# 	count += 1
	# myobj = {
	# 	hero_name: key,
	# 	img_url: '/assets/hero_pics/' + key +'.png',
	# 	roles: value['droles'],
	# 	char_type: value['pa']

	# }
	# Champion.create(hero_name: myobj[:hero_name],img_url: myobj[:img_url],roles: myobj[:roles],char_type: myobj[:char_type])
# 	puts count 
# 	puts key
# end

