json.articles do
  json.array! @articles, partial: 'articles/article', as: :article
end

json.workout @featured_workout, partial: 'workouts/workout', as: :workout

# json.videos do
#   json.array! @featured_videos, partial: 'videos/video', as: :video
# end
