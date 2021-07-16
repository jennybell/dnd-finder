class AddColumnDmToGroupUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :group_users, :dm, :boolean
  end
end
