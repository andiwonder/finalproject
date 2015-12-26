class Note < ActiveRecord::Base

  belongs_to :match , foreign_key: "match_id"  

end
