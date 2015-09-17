class UsersController < ApplicationController

	def index
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

		redirect_to "/"
	end

  	def show
    	actual_user = User.find(session[:user_id])
    	if logged_in? && check_current_user?
      		@current_user = User.find(session[:user_id])
      		@response = HTTParty.get('http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=73626CB2E22E10D9F4AB0D7ECBAF600B&steamids=76561197981778464')
          
          render json: @response
    	else
      		redirect_to user_path(actual_user)
    	end
  	end

  	private
  	def user_params
    	params.require(:user).permit(:user_name, :password)
  	end

end