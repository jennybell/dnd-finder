class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :group_users 
  has_many :groups, through: :group_users

  has_one_attached :avatar

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
