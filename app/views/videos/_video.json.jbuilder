json.extract! video, :id, :youtube_id, :description, :duration, :title
json.url video_url(video, format: :json)
