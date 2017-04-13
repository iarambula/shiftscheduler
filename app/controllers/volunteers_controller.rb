class VolunteersController < ApplicationController
  before_action :set_volunteer, except: [ :index, :new, :create ]

  def index
    @volunteers = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new
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
    redirect_to volunteers_url
  end

  private

  def volunteer_attributes
    params.require(:volunteer).permit(:full_name, :group_id, :email, :home_number, :mobile_number, :recieve_texts)
  end

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end
end
