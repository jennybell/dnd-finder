class AddCharacterNameToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :character_name, :text
    add_column :invitations, :character_race, :text
    add_column :invitations, :character_class, :text
  end
end
