class TestController < ApplicationController

	def background
	end

	

	def chin
		myheroes= []
		myroles = []
		@players = Player.where(user_id: 1)
		@last_match = Match.find(1)
		@players.each do |player|
			myheroes.push(player['hero_id'])
			champ = Champion.find(player['hero_id'])
			myroles.push(champ['roles'])
		end
		@freq = myheroes.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      	@test = @freq.sort_by {|_key, value| value}
      	@my_fav_heroes = [@test[-1],@test[-2],@test[-3],@test[-4],@test[-5]]


      	@items = Item.all 

      respond_to do |format|
        format.html
        format.json {render json: @items}
      end

	end

 	def cannon



    end

    def twitch

    end


















	def test
			
		@recent_matches = HTTParty.get("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&account_id=76561197981778464")
    	# @steam_32_id = @current_user.steam_id.to_i - 76561197960265728
    	# steam_32_id = 21512736
	    @games = @recent_matches['result']['matches']
	    @games.each do |game|
	    	@match_in_arr = game['match_id'].to_s
			@match = HTTParty.get('https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?match_id=' + @match_in_arr + '&key=73626CB2E22E10D9F4AB0D7ECBAF600B')
			actual_user = User.find(session[:user_id])


			@current_match = Match.create(

			radiant_win: @match['result']['radiant_win'],
			duration: @match['result']['duration'],
			start_time: @match['result']['start_time'],
			match_id: @match['result']['match_id'],
			match_seq_num: @match['result']['match_seq_num'],
			tower_status_radiant: @match['result']['tower_status_radiant'],
			tower_status_dire: @match['result']['tower_status_dire'],
			barracks_status_radiant: @match['result']['barracks_status_radiant'],
			barracks_status_dire: @match['result']['barracks_status_dire'],
			cluster: @match['result']['cluster'],
			first_blood_time: @match['result']['first_blood_time'],
			lobby_type: @match['result']['lobby_type'],
			human_players: @match['result']['human_players'],
			leagueid: @match['result']['leagueid'],
			positive_votes: @match['result']['positive_votes'],
			negative_votes: @match['result']['negative_votes'],
			game_mode: @match['result']['game_mode'],
			engine: @match['result']['engine'],
			user_id: session[:user_id]
	    	
			)


			@match['result']['players'].each do |player|
				@player = player
				@myabl = []
				@mylvl = []
				@mytime = []
				@my_id	

				@player['ability_upgrades'].each do |ability|
					@myabl.push(ability['ability'])
					@mylvl.push(ability['level'])
					@mytime.push(ability['time'])
				end


				if @player['account_id'] == (76561197981778464 - 76561197960265728)
					puts "found you!"
					@my_id = 1
				else
					@my_id = nil
				end

				@current_player = Player.create(

					account_id: @player['account_id'].to_i,
					player_slot: @player['player_slot'].to_i ,
					hero_id: @player['hero_id'].to_i ,
					item_0: @player['item_0'].to_i ,
					item_1: @player['item_1'].to_i ,
					item_2: @player['item_2'].to_i ,
					item_3: @player['item_3'].to_i ,
					item_4: @player['item_4'].to_i ,
					item_5: @player['item_5'].to_i ,
					kills: @player['kills'].to_i ,
					deaths: @player['deaths'].to_i ,
					assists: @player['assists'].to_i ,
					leaver_st: @player['leaver_st'].to_i ,
					gold: @player['gold'].to_i ,
					last_hits: @player['last_hits'].to_i ,
					denies: @player['denies'].to_i ,
					gold_per_min: @player['gold_per_min'].to_i ,
					xp_per_min: @player['xp_per_min'].to_i ,
					gold_spent: @player['gold_spent'].to_i ,
					hero_damage: @player['hero_damage'].to_i ,
					tower_damage: @player['tower_damage'].to_i ,
					hero_heal: @player['hero_heal'].to_i ,
					end_level: @player['level'].to_i ,
					levels: @mylvl ,
					abilities: @myabl ,
					time: @mytime ,
					match_id: @current_match['id'],
					user_id: @my_id
				)
			end
		end
			render json: @recent_matches
	end
end



