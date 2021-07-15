class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @group_id = params[:group_id]
    invitation = Invitation.create(group_id: @group_id, sender_id: current_user.id, confirmed: false)
    invitation.save!
    redirect_to group_path(@group_id)
  end

  def update 
    sender = params[:user_id]
    group = params[:group_id]
    group_user = GroupUser.create(group_id: group, user_id: sender)
    group_user.save!

    result = Invitation.where(sender_id: sender, group_id: group, confirmed: false).first
    result.update_column(:confirmed, true)

    redirect_to group_path(group)
  end
end
