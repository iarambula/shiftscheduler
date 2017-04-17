class GroupsController < ApplicationController
  before_action :set_group, except: [ :index, :new, :create ]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_attributes)

    if @group.save
      redirect_to @group, notice: 'Group was successfully saved.'
    else
      render action: :new
    end
  end

  def update
    if @group.update_attributes(group_attributes)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_attributes
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
