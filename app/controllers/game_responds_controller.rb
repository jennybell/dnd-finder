class GameRespondsController < ApplicationController
  def index
    
  end
  
  def create
    p params[:game_id]
    @group = Group.find(params[:group_id])
    @game = Game.find(params[:game_id])
    @comment = @game.game_responds.create(user_id: current_user)
    redirect_to group_path(@group)
  end
end
