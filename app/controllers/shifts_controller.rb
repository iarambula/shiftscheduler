class ShiftsController < ApplicationController
  before_action :set_shift, except: [ :index, :new, :create ]

  def index
    if params[:date].present?
      day = Date.parse(params[:date]).strftime('%A').parameterize
      @shifts = Shift.where(day: day)
    else
      @shifts = Shift.all
    end
  end

  def new
    @shift = Shift.new
  end

  def show
    @q = @shift.volunteers.includes(:group).ransack(params[:q])
    @volunteers = @q.result()
  end

  def create
    @shift = Shift.new(shift_attributes)

    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'shift was successfully saved.' }
        format.js { render :create, status: :created }
      else
        format.html { render action: :new }
        format.js { render :create, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @shift.update_attributes(shift_attributes)
      redirect_to @shift, notice: 'shift was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to shifts_path
  end

  private

  def shift_attributes
    params.require(:shift).permit(:day, :starts_at, :ends_at)
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end
end
