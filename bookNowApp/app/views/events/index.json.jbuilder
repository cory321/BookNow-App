json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :all_day, :couple_id
  json.start event.start_time
  json.end event.end_time
  json.url couple_url(event.couple_id)
end
