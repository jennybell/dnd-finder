class AddCharacterRaceToGroupUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :group_users, :character_name, :text
    add_column :group_users, :character_race, :text
    add_column :group_users, :character_class, :text
  end
end
