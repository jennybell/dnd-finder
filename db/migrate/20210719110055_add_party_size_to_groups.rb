class AddPartySizeToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :party_size, :integer
  end
end
