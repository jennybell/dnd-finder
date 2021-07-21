class AddCompleteToGameResponds < ActiveRecord::Migration[6.1]
  def change
    add_column :game_responds, :complete, :boolean
  end
end
