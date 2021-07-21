class AddGameIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :games, null: false, foreign_key: true
  end
end
