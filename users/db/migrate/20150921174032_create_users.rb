class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :user_name
	    t.string :password_digest
	    t.string :skype_id
	    t.string :steam_id
	    t.integer :solo_mmr
	    t.integer :party_mmr

	   	t.timestamps null: false
    end
  end
end
