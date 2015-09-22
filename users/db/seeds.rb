# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


swap = User.create(user_name: 'swap', password:'123',skype_id: 'skasliwal12',steam_id: '76561197981778464' ,solo_mmr: '4250' , party_mmr: '3250')
tyler = User.create(user_name: 'tyler', password:'123',skype_id: 'tyler.zboran',steam_id: '76561197995691850' ,solo_mmr: '4150' , party_mmr: '3350')
chin = User.create(user_name: 'chin', password:'123',skype_id: 'revel2k9',steam_id: '76561198052440016' ,solo_mmr: '4050' , party_mmr: '3450')
cannon = User.create(user_name: 'cannon', password:'123',skype_id: 'thecannonman',steam_id: '76561198080492420' ,solo_mmr: '3950' , party_mmr: '3550')
crayon = User.create(user_name: 'crayon', password:'123',skype_id: 'edwinchen50',steam_id: '76561198006533142' ,solo_mmr: '3850' , party_mmr: '3650')

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

















