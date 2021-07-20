class AddPartyLevelToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :party_level, :integer
  end
end
