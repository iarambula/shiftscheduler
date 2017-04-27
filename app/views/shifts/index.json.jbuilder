json.array! @shifts do |shift|
  json.id shift.id
  json.text shift.readable_shift
end