class GamesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @game = Game.create(group_id: @group.id, date: params[:date], time: params[:time])
    redirect_to group_path(@group)
  end

  # def show
  #   @game_responds = GameRespond.where(game_id: game_id)
  # end
end
