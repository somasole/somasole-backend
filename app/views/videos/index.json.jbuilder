json.videos do
  json.array! @videos, partial: 'videos/video', as: :video
end