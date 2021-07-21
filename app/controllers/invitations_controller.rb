class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    invitation = Invitation.create(invitation_params)
    invitation.save!
    redirect_to group_path(params[:group_id])
  end

  def update 
    result = Invitation.find_by(sender_id: params[:user_id], group_id: params[:group_id], confirmed: false)
    result.update_column(:confirmed, true)

    group_user = GroupUser.create(group_user_params)
    group_user.save!
    group_user.update_columns(character_name: result.character_name, character_race: result.character_race, character_class: result.character_class)

    redirect_to group_path(params[:group_id])
  end

  def show
    @group_id = params[:group_id]
  end

  private 

  def invitation_params
    params.permit(:group_id, :character_name, :character_race, :character_class).merge(sender_id: current_user.id, confirmed: false)
  end

  def group_user_params
    params.permit(:user_id, :group_id).merge(dm: false, admin: false)
  end
end
