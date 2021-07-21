class CommentsController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.create(comment_params)
    redirect_to groups_path
  end

  def destroy
    @message = Message.find(params[:message_id])
    @comment = @message.comments.find(params[:id])
    @comment.destroy
    redirect_to groups_path
  end 

  private 

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
