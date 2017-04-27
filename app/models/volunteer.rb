class Volunteer < ApplicationRecord
  belongs_to :group, required: false
  has_and_belongs_to_many :shifts
  has_many :events

  validates :full_name, presence: true

  def names_list
    if additional.present?
      [ full_name ].concat(additional.split("\r\n"))
    else
      [ full_name ]
    end
  end

  def description
    "#{full_name} #{mobile_number} #{group.name}"
  end
end
