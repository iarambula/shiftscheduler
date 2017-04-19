json.array! @events do |event|
  json.title event.volunteer.full_name
  json.start event.starts_at
  json.end event.ends_at
  json.url event_path event
end