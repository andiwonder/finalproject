class AddForeignKeyToPlayers < ActiveRecord::Migration
  def change
    add_foreign_key :players, :users
  end
end
