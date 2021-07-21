class GamesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @game = Game.create(group_id: @group.id, date: params[:date], time: params[:time], name: params[:name], location: params[:location])
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
end
