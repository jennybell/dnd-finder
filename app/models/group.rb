class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_user
  has_many :messages
  has_many :invitations
  has_many :games
end
