class Volunteer < ApplicationRecord
  belongs_to :group, required: false
  validates :full_name, presence: true
end
