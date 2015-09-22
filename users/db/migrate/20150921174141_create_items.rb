class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
   		t.string :img_url
   		t.string :cost
   		t.string :notes
   		t.string :lore

  		t.timestamps null: false
    end
  end
end
