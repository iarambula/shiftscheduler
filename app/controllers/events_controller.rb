class EventsController < ApplicationController
  def index
    respond_to do |format|
      format.json { @events = Event.includes(:volunteer).where('ends_at > ? AND starts_at < ?', params[:start], params[:end]) }
      format.csv { send_data Event.to_csv, filename: "events-#{Date.current}.csv" }
      format.html {}
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def bulk_create
    starts_at = Date.parse(bulk_params[:starts_at])
    ends_at = Date.parse(bulk_params[:ends_at])

    starts_at.upto(ends_at) do |d|
      day = d.strftime('%A').downcase
      shifts = Shift.where(day: day)
      byebug
      shifts.each do |s|
        volunteers = Volunteer.where(id: shift_volunteers(s)).order('volunteers.count DESC')
        count = Event.left_joins(:volunteer).where(shift: s).sum(:count)

        if volunteers.first.present? && count == 0
          Event.create(
            volunteer: volunteers.first,
            shift: s,
            shift_date: d
          )
        end

        if volunteers.second.present? && volunteers.first.count < 2 && count == 0
          Event.create(
            volunteer: volunteers.second, 
            shift: s,
            shift_date: d
          )
        end
      end
    end
    redirect_to events_path, notice: 'Events were generated successfully.'
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_attributes)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render action: :edit
    end
  end

  def create
    @event = Event.new(event_attributes)

    if @event.save
      redirect_to @event, notice: 'Volunteer was successfully created.'
    else
      render action: :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def bulk_params
    params.require(:events).permit(:starts_at, :ends_at)
  end

  def event_attributes
    params.require(:event).permit(:volunteer_id, :shift_date, :shift_id)
  end

  def shift_volunteers(s)
    s.volunteers.left_joins(:events).group(:id).order('COUNT(events.id) ASC, volunteers.group_id').limit(2)
  end
end
