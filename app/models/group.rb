class Group < ApplicationRecord
  has_many :volunteers
  has_many :events, through: :volunteers

  default_scope { order(:name) }

  validates :name, presence: true
  validates :name, uniqueness: true
end
