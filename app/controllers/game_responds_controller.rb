class GameRespondsController < ApplicationController
  def index
    
  end
  
  def create
    @group = Group.find(params[:group_id])
    @game = Game.find(params[:game_id])
    @game_respond = @game.game_responds.create(user_id: current_user.id)
    @game_respond.save!
    redirect_to group_path(@group)
  end
end
