class GamesController < ApplicationController
  def create
    p params
    @group = Group.find(params[:group_id])
    @game = Game.create(group_id: @group.id, date: params[:date], time: params[:time], name: params[:name])
    redirect_to group_path(@group)
  end

  def update
    game = Game.find(params[:id])
    players = GameRespond.where(game_id: game.id)
    game.update_column(complete: true)
    redirect_to group_path(params[:group_id])
  end
end
