class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.references :sender, null: false, references: :users, foreign_key: { to_table: :users}
      t.references :receiver, null: false, references: :users, foreign_key: { to_table: :users}
      t.boolean :confirmed

      t.timestamps
    end
  end
end
