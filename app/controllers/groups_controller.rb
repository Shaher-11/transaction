class GroupsController < ApplicationController
  before_action :set_group, only: %i[show]

  before_action :require_user

  def index
    @groups = current_user.groups.asc unless current_user.groups.size.zero?
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save

      flash[:success] = "#{@group.name} Group has been created successfully!"

      redirect_to groups_path

    else

      flash.now[:error] = @group.errors.full_messages

      render :new

    end
  end

  def show
    if current_user.groups.include? @group

      @expenses = nil

      @expenses = @group.expenses.desc if @group.expenses.exists?

    else

      flash[:danger] = 'You are not allowed to perform this action and view other users groups'

      redirect_to groups_path

    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :image)
  end
end
