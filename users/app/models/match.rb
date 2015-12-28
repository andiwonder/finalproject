class Match < ActiveRecord::Base
	
	has_many :players
	# has_many :users, class_name: "Player", foreign_key: "user_id"	
  has_many :users, through: :players

end