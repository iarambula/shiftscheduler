class Volunteer < ApplicationRecord
  belongs_to :group, required: false
  has_and_belongs_to_many :shifts
  has_many :events

  validates :full_name, presence: true
end
