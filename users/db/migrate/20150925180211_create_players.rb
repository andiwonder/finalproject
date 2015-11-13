class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|



   		t.integer :account_id, :limit => 8
		t.integer :player_slot
		t.integer :hero_id
		t.integer :item_0
		t.integer :item_1
		t.integer :item_2
		t.integer :item_3
		t.integer :item_4
		t.integer :item_5
		t.integer :kills
		t.integer :deaths
		t.integer :assists
		t.integer :leaver_st
		t.integer :gold
		t.integer :last_hits
		t.integer :denies
		t.integer :gold_per_min
		t.integer :xp_per_min
		t.integer :gold_spent
		t.integer :hero_damage
		t.integer :tower_damage
		t.integer :hero_heal
		t.integer :end_level
		t.text :levels, array: true, default: []
		t.text :abilities, array: true, default: []
		t.text :time, array: true, default: []

		t.references :match, index: true, foreign_key: true
		t.belongs_to :user, index: true

		t.timestamps null: false
    end
  end
end
