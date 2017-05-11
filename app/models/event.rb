require 'csv'

class Event < ApplicationRecord
  belongs_to :volunteer
  belongs_to :shift
  before_save :populate_datetime_fields

  enum status: [ :unconfirmed, :confirmed ]

  def self.to_csv
    attributes = ["Subject", "Start Date", "Start Time", "End Date", "End Time", "All Day Event", "Description", "Location", "Private"]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.order(:starts_at).group_by(&:starts_at).map do |starts_at, events|
        csv << [
          events.map { |e| e.volunteer.names_list  }.flatten.join(", "),
          events.first.starts_at.strftime("%m/%d/%Y"),
          events.first.starts_at.strftime("%r"),
          events.first.ends_at.strftime("%m/%d/%Y"),
          events.first.ends_at.strftime("%r"),
          false,
          events.map { |e| e.volunteer.description }.flatten.join("\n"),
          "400 Haven Dr, Arvin, CA 93203",
          false
        ]
      end
    end
  end

  def related
    Event.where.not(volunteer: self.volunteer).where(starts_at: self.starts_at).where(ends_at: self.ends_at)
  end

  private

  def populate_datetime_fields
    self.starts_at = combine_date_time(self.shift_date, self.shift.starts_at)
    self.ends_at = combine_date_time(self.shift_date, self.shift.ends_at)
  end

  def combine_date_time(d, t)
    DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
  end
end
