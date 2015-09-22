class UsersController < ApplicationController

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


      @myObj = {
        "avatar" => @player_summary['response']['players'][0]['avatarfull'],
        "name" => @player_summary['response']['players'][0]['personaname'],
        "state" => @player_summary['response']['players'][0]['personastate'],
        "loc_country" => @player_summary['response']['players'][0]['loccountrycode'],
        "loc_state" => @player_summary['response']['players'][0]['locstatecode'],
        "loc_city_id" => @player_summary['response']['players'][0]['locstatecode'],
        "playtime_2wks" => dota.first['playtime_2weeks']/60 ,
        "playtime_forever" => dota.first['playtime_forever']/60
      }


      @friends = HTTParty.get("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&steamid=76561197981778464&relationship=friend")
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

      


      respond_to do |format|
        format.html
        format.json {render json: @online }
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