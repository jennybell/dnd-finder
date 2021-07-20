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

  def destroy
    @group = Group.find(params[:group_id])
    @game = Game.find(params[:game_id])
    @game_respond = GameRespond.where(params[:id])
    p @game
    @game_respond.destroy
  end
end
