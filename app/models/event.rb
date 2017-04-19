class Event < ApplicationRecord
  belongs_to :volunteer
  belongs_to :shift
end
