class Shift < ApplicationRecord
  has_and_belongs_to_many :volunteers
  enum day: [ :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday ]

  validates :day, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  def readable_shift
    "#{day.humanize}: #{starts_at.strftime '%I:%M %p'} - #{ends_at.strftime '%I:%M %p'}"
  end
end
