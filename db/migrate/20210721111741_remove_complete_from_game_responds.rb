class RemoveCompleteFromGameResponds < ActiveRecord::Migration[6.1]
  def change
    remove_column :game_responds, :complete, :boolean
  end
end
