class Game < ApplicationRecord
  belongs_to :group
  has_many :game_responds
end
