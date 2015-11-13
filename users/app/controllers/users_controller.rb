class UsersController < ApplicationController

    def most_common_value(a)
      a.group_by(&:itself).values.max_by(&:size).first(3)
    end

    def mode
      sort_by {|i| grep(i).length }.last
    end

    def initialize
      @offline = []
      @online = []
      @away = []
    end

  	def index
      redirect_to "/users/" + session[:user_id].to_s
    end


    def create
      u = User.create(
        user_name: params[:user_name],
        password: params[:password],
        skype_id: params[:skype_id],
        steam_id: params[:steam_id],
        solo_mmr: params[:solo_mmr],
        party_mmr: params[:party_mmr]
        )

      redirect_to "/sessions/new"
    end



    def show
     actual_user = User.find(session[:user_id])
     if logged_in? && check_current_user?
      puts "yoooo"
      @current_user = User.find(session[:user_id])
      @player_summary = HTTParty.get('http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&steamids=' + @current_user.steam_id )
      @recent_game = HTTParty.get("http://api.steampowered.com/IPlayerService/GetRecentlyPlayedGames/v0001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&steamid=" + @current_user.steam_id + "&format=json")
      dota = []
      @recent_game['response']['games'].each do |game|
        if game['appid']== 570
          dota.push(game)
        end
      end


      @profile_info_display = {
        "avatar" => @player_summary['response']['players'][0]['avatarfull'],
        "name" => @player_summary['response']['players'][0]['personaname'],
        "state" => @player_summary['response']['players'][0]['personastate'],
        "loc_country" => @player_summary['response']['players'][0]['loccountrycode'],
        "loc_state" => @player_summary['response']['players'][0]['locstatecode'],
        "loc_city_id" => @player_summary['response']['players'][0]['locstatecode'],
        "playtime_2wks" => dota.first['playtime_2weeks']/60 ,
        "playtime_forever" => dota.first['playtime_forever']/60
      }


      @friends = HTTParty.get("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&steamid=" + @current_user.steam_id + "&relationship=friend")
      @friends_list = []
      @friends['friendslist']['friends'].each do |friend|
        steam_64_id = friend['steamid']
        @friends_list.push(steam_64_id)
      end


      @friends_list_string = @friends_list.map(&:inspect).join(', ')
      @friend_summaries = HTTParty.get('http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&steamids=' + @friends_list_string)


      @friend_summaries_list = []
      @friend_summaries['response']['players'].each do |friend_summary|
        newobj = {
          "name" => friend_summary['personaname'],
          "avatar" => friend_summary['avatarmedium'],
          "state" => friend_summary['personastate'],
          "loc_state" => friend_summary['locstatecode'],
          "loc_city_id" => friend_summary['loccityid']
        }
        @friend_summaries_list.push(newobj)
      end


      @friend_summaries_list.each do |friend|
        if friend['state'] == 0
          @offline.push(friend)
        elsif friend['state'] == 1
          @online.push(friend)
        else
          @away.push(friend) 
        end
      end

      @recent_matches = HTTParty.get("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&account_id="+ @current_user.steam_id)
      @steam_32_id = @current_user.steam_id.to_i - 76561197960265728
      @games = @recent_matches['result']['matches']
      @mygames_list = []
      @myheroes_list = []


      @games.each do |game|
        @mygames_start = game['start_time']
        @mygames_start_time = Time.at(@mygames_start).strftime("%F %I:%M %p")
          myObj = {
            "match_id" => game['match_id'],
            "start_time" => @mygames_start_time,
            "lobby_type" => game['lobby_type'],
          }

        game['players'].each do |player|
            if player['account_id'] == @steam_32_id
              @myhero = Champion.find(player['hero_id'])
              myObj["hero_id"] = player['hero_id']
              myObj["hero_pic"] =  @myhero['img_url']    
              myObj["hero_name"] = @myhero['hero_name']
              myObj["hero_role"] = @myhero['roles']
              myObj["hero_type"] = @myhero['char_type']
            end
        end

      @myheroes_list.push(myObj['hero_id'])
      @mygames_list.push(myObj)

      end

      @top_3_list = []
      @freq = @myheroes_list.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      @swap = @myheroes_list.max_by { |v| @freq[v] }
      @test = @freq.sort_by {|_key, value| value}
      @my_fav_heroes = [@test[-1],@test[-2],@test[-3],@test[-4],@test[-5]]

      @my_fav_heroes.each do |hero|
        @temphero = Champion.find(hero[0])
        @frequency = [hero[1]]
        top_3_heroes = {
        "hero_id" => hero[0],
        "frequency" => @frequency,
        "hero_pic" =>  @temphero['img_url'],    
        "hero_name" => @temphero['hero_name']
        }
        @top_3_list.push(top_3_heroes)
      end


      respond_to do |format|
        format.html
        format.json {render json: @profile_info_display}
      end
    else
      redirect_to user_path(actual_user)
    end
  end



  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end






  # "avatarfull":
  # personaname
  # personastate

  # if available

  # loccountrycode": "US",
  # "locstatecode": "WA",
  # "loccityid": 3961

  # grab if appid 570 data
  # playtime_2weeks": 5088,
  # "playtime_forever": 318586,


  # var x = 1442775654*1000
  # undefined
  # var date = new Date(x);

  # On a system that supports up to 64-bit numbers you can do the following:
  # STEAMID64 - 76561197960265728 = STEAMID32
  # STEAMID32 + 76561197960265728 = STEAMID64

  # 76561197981778464 - 76561197960265728




  #           ("http://api.steampowered.com/ISteamEconomy/GetAssetPrices/v0001/?appid=570&key=73626CB2E22E10D9F4AB0D7ECBAF600B")
  #           ("http://api.steampowered.com/IEconItems_570/GetPlayerItems/v0001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&steamid=76561197981778464")
  #           ("http://api.steampowered.com/ISteamEconomy/GetAssetClassInfo/v0001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&appid=570&class_count=1&classid0=106611040,92319768")
  #           ("http://steamcommunity-a.akamaihd.net/economy/image/" + imgurl
  #           