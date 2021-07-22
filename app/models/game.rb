class Game < ApplicationRecord
  belongs_to :group
  has_one :message
  has_many :game_responds
end
