json.workouts do
  json.array! @workouts, partial: 'api/v1/workouts/workout', as: :workout
end