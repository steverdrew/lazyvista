json.array!(@calendar_events) do |event|
  json.extract! event, :id, :title, :description, :start_time, :end_time, :calendar_id
  json.url event_url(event, format: :json)
end