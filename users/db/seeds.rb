# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

      user_name: params[:user_name],
      password: params[:password],
      skype_id: params[:skype_id],
      steam_id: params[:steam_id],
      solo_mmr: params[:solo_mmr].to_i,
      party_mmr: params[:party_mmr].to_i

swap = User.create(user_name: 'Swap', password:'123',skype_id: 'skasliwal12',steam_id: '125' ,  )