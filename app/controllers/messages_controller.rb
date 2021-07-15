class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @group = Group.find(params[:group_id])
    @message = Message.create(group_id: @group.id, user_id: current_user.id, content: params[:content])
    @message.save!
    redirect_to group_path(@group)
  end
end