class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @group = Group.find(params[:group_id])
    @message = Message.create(message_params)
    @message.save!
    redirect_to group_path(@group)
  end

  private 

  def message_params 
    params.permit(:content, :group_id).merge(user_id: current_user.id)
  end
end