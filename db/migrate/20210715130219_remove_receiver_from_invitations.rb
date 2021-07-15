class RemoveReceiverFromInvitations < ActiveRecord::Migration[6.1]
  def change
    remove_column :invitations, :receiver_id, :integer
  end
end
