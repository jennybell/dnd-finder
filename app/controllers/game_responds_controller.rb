class GameRespondsController < ApplicationController
  
  def index
    @game = Game.find(params[:game_id])
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
    @game_respond = GameRespond.where(game_id: @game.id, user_id: current_user.id).first
    @game_respond.destroy
    redirect_to group_path(@group)
  end
end
