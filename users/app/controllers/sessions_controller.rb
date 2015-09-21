class SessionsController < ApplicationController

	def new
	end

	def create
		puts params[:user_name]
	    user = User.find_by({user_name: params[:user_name]})


	    if user 
	    	puts "heyyyyyyyyyyyyyyyyy"
	      session[:user_id] = user.id
	      	puts user.id
	      redirect_to '/welcome'
	    else
	    	puts "narrrrrrrrrrr"
	      redirect_to '/sessions/new'
	    end
	end
end