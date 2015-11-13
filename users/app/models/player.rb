class Player < ActiveRecord::Base
	belongs_to :match
	has_one :users, foreign_key: "user_id" 	
end