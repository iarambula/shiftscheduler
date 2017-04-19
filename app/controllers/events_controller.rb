class EventsController < ApplicationController
  def index
    respond_to do |format|
      format.json { @events = Event.where('ends_at > ? AND starts_at < ?', params[:start], params[:end]) }
      format.html {}
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def bulk_create
    starts_at = get_date 'starts_at'
    ends_at = get_date 'ends_at'

    starts_at.upto ends_at do |d|
      day = d.strftime('%A').downcase
      shifts = Shift.where(day: day)
      shifts.each do |s|
        volunteers = Volunteer.where(id: s.volunteers.left_joins(:events).group(:id).order('COUNT(events.id) ASC, volunteers.group_id').limit(2)).order('volunteers.count DESC')

        if volunteers.first.present?
          Event.create(
            volunteer: volunteers.first,
            shift: s,
            starts_at: combine_date_time(d, s.starts_at),
            ends_at: combine_date_time(d, s.ends_at)
          )
        end

        if volunteers.first.count < 2 && volunteers.second.present?
          Event.create(
            volunteer: volunteers.second, 
            shift: s, 
            starts_at: combine_date_time(d, s.starts_at),
            ends_at: combine_date_time(d, s.ends_at)
          )
        end
      end
    end
    redirect_to events_path, notice: 'Events were generated successfully.'
  end

  private

  def combine_date_time(d, t)
    DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
  end

  def get_date(param)
    Date.new bulk_params["#{param}(1i)"].to_i, bulk_params["#{param}(2i)"].to_i, bulk_params["#{param}(3i)"].to_i
  end

  def bulk_params
    params.require(:events).permit(:starts_at, :ends_at)
  end
end
