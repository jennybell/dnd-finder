class CommentsController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.create(params[:comment].permit(:name, :body))
    redirect_to groups_path
  end

end
