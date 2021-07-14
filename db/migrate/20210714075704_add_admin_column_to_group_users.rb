class AddAdminColumnToGroupUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :group_users, :admin, :boolean
  end
end
