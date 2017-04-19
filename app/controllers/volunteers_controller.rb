class VolunteersController < ApplicationController
  before_action :set_volunteer, except: [ :index, :new, :create ]

  def index
    @q = Volunteer.includes(:group).ransack(params[:q])
    @volunteers = @q.result()
  end

  def new
    @volunteer = Volunteer.new
    @shifts = Shift.all
  end

  def create
    @volunteer = Volunteer.new(volunteer_attributes)
    if @volunteer.save
      redirect_to @volunteer, notice: 'Volunteer was successfully created.'
    else
      render action: :new
    end
  end

  def update
    if @volunteer.update_attributes(volunteer_attributes)
      redirect_to @volunteer, notice: 'Volunteer was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @volunteer.destroy
    redirect_to volunteers_path
  end

  private

  def volunteer_attributes
    params.require(:volunteer).permit(:full_name, :additional, :count, :group_id, :email, :home_number, :mobile_number, :recieve_texts, :key_person, :shift_ids => [])
  end

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end
end
