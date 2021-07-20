class AddGameEditionToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :game_edition, :text
  end
end
