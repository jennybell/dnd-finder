class CommentsController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:message_id])
    @comment = @message.comments.create(params[:comment].permit(:name, :body))
    redirect_to group_path(@group)
  end

  def destroy
    @message = Message.find(params[:message_id])
    @comment = @message.comments.find(params[:id])
    @comment.destroy
    redirect_to groups_path
  end 

end
