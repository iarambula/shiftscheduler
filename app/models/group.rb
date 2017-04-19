class Group < ApplicationRecord
  has_many :volunteers
  validates :name, presence: true
  validates :name, uniqueness: true
end
