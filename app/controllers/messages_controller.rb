class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @group = Group.find(params[:group_id])
    @message = Message.create(group_id: @group.id, user_id: current_user.id, content: params[:message])
    redirect_to group_path(@group)
  end

  private

  def comment_params
    if params[:message].is_a? String
      Hash.new(params[:message])
    else
      params.require(:message).permit(:content).merge(user_id: current_user.id)
    end
  end
end