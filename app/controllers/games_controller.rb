class GamesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @game = Game.create(game_params)
    @message = Message.create(game_id: @game.id, group_id: @group.id, user_id: current_user.id)
    @message.save!
    redirect_to group_path(@group)
  end

  def update
    game = Game.find(params[:id])
    game.update_column(:complete, true)
    players = GameRespond.where(game_id: game.id)
    players.each do |player| 
      player.user.rating += 13
      player.user.save!
    end
    redirect_to group_path(params[:group_id])
  end

  private 

  def game_params
    params.permit(:date, :time, :name, :location).merge(group_id: @group.id)
  end
end
