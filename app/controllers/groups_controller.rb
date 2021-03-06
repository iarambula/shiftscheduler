class GroupsController < ApplicationController
  before_action :set_group, except: [ :index, :new, :create, :events ]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @q = @group.volunteers.ransack(params[:q])
    @volunteers = @q.result()
  end

  def events
    @group = Group.find(params[:group_id])
    event_start_dates = @group.events.pluck(:starts_at)
    @events = Event.where(starts_at: event_start_dates).where('events.starts_at > ?', DateTime.current)
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
