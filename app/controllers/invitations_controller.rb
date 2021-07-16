class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @group_id = params[:group_id]
    invitation = Invitation.create(invitation_params)
    invitation.save!
    redirect_to group_path(@group_id)
  end

  def update 
    group_user = GroupUser.create(group_user_params)
    group_user.save!

    sender = params[:user_id]
    group = params[:group_id] 
    result = Invitation.where(sender_id: sender, group_id: group, confirmed: false).first
    result.update_column(:confirmed, true)

    redirect_to group_path(group)
  end

  private 

  def invitation_params
    params.permit(:group_id).merge(sender_id: current_user.id, confirmed: false)
  end

  def group_user_params 
    params.permit(:user_id, :group_id)
  end
end
