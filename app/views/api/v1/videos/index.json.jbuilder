json.videos do
  json.array! @videos, partial: 'api/v1/videos/video', as: :video
end