class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|

      t.string :start_time
      t.string :end_time
      t.string :category
      t.string :player_notes, array: true, default: []
      t.string :vid_url , array: true, default: []
      
      
      t.references :match, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
