class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @users = User.all
    @groups = Group.all
    @group_users = GroupUser.all
  end

end