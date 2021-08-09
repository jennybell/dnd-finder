class AddForeignKeyGamesIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :messages, :games
  end
end
