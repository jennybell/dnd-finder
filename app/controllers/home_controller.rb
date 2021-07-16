class HomeController < ApplicationController
  before_action :authenticate_user!

  def index 
      @user = User.find(current_user.id)
      @users = User.all
      @groups = Group.all
      @group_users = GroupUser.all
  end
end
