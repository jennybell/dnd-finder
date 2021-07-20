class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_user
  has_many :messages, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :games, dependent: :destroy
  has_one_attached :image
end
