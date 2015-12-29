class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	

    t.boolean :radiant_win
		t.integer :duration
		t.integer :start_time, :limit => 8
		t.integer :match_id, :limit => 8 
		t.integer :match_seq_num, :limit => 8
		t.integer :tower_status_radiant
		t.integer :tower_status_dire
		t.integer :barracks_status_radiant
		t.integer :barracks_status_dire
		t.integer :cluster
		t.integer :first_blood_time
		t.integer :lobby_type
		t.integer :human_players
		t.integer :leagueid
		t.integer :positive_votes
		t.integer :negative_votes
		t.integer :game_mode
		t.integer :engine
		
		t.references :user, index: true
 		t.timestamps null: false

    	
    end
  end
end
