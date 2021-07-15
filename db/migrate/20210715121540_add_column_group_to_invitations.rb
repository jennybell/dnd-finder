class AddColumnGroupToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_reference :invitations, :group, null: false, foreign_key: true
  end
end
