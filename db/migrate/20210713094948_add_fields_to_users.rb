class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :location, :string
    add_column :users, :rating, :integer
    add_column :users, :dm, :boolean
    add_column :users, :terms, :boolean
  end
end
