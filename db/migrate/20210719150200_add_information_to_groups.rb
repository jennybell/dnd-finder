class AddInformationToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :information, :text
  end
end
