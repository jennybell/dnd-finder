class AddGameIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :game_id, :integer
  end
end
