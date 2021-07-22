class RemoveGamesFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :games_id, :integer
  end
end
