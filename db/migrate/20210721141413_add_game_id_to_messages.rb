class AddGameIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :games, null: true, foreign_key: true
  end
end
