class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    group_id = params[:id]
    @user = GroupUser.where(group_id: group_id, user_id: current_user.id).first
    @messages = Message.where(group_id: group_id)
    @requests = Invitation.where(group_id: group_id, confirmed: false)
    @users = GroupUser.where(group_id: group_id)
    @games = Game.all
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  def assign_dm 
    user = params[:user_id]
    group = params[:group_id]
    dm = GroupUser.where(group_id: group, user_id: user).first
    dm.update_column(:dm, true)
    redirect_to group_path(group)
  end

  # GET /groups/1/edit
  def edit
    group = Group.where(id: @group.id)
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        @user_group = GroupUser.create(group_user_params)
        format.html { redirect_to @group, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # @user_group = GroupUser.create(group_id: @group.id, user_id: current_user.id, admin: true)

    def group_params
      params.require(:group).permit(:name, :party_size, :information, :image)
    end

    def group_user_params
      params.require(:group).permit(:character_name, :character_race, :character_class).merge(group_id: @group.id, user_id: current_user.id, admin: true)
    end
end
