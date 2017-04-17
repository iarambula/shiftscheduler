class Volunteer < ApplicationRecord
  belongs_to :group, required: false
  has_and_belongs_to_many :shifts

  validates :full_name, presence: true
end
