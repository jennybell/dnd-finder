class AddNameToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :name, :text
  end
end
