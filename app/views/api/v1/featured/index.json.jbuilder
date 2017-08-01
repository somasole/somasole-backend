json.articles do
  json.array! @articles, partial: 'api/v1/articles/article', as: :article
end

json.workout @featured_workout, partial: 'api/v1/workouts/workout', as: :workout

json.videos do
  json.array! @featured_videos, partial: 'api/v1/videos/video', as: :video
end
