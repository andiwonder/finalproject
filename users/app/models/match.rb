class Match < ActiveRecord::Base
	
	has_many :players
	has_one :user, class_name: "Player", foreign_key: "user_id"	

end