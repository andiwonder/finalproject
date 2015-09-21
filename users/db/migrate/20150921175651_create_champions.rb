class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
    	t.string :hero_name
   		t.string :img_url
   		t.string :roles
   		t.string :char_type

  		t.timestamps null: false
    end
  end
end
