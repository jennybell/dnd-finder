class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :location, :string
    add_column :users, :rating, :integer, default: 0
    add_column :users, :dm, :boolean, default: false
    add_column :users, :terms, :boolean, default: false

    add_column :users, :alignment, :string, default: ""
    add_column :users, :username, :string
    add_column :users, :bio, :string
  end
end
