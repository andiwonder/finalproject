class AddSteam32ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :steam32, :integer
  end
end
