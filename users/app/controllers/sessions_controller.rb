class SessionsController < ApplicationController

	def new
	end

	def create
	    user = User.find_by({user_name: params[:user_name]})

	    if user && user.password == params[:password]
	      session[:user_id] = user.id
	      redirect_to '/users/user.id'
	    else
	      redirect_to '/sessions/new'
	    end
	end
end