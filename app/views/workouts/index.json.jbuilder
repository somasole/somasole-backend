json.workouts do
  json.array! @workouts, partial: 'workouts/workout', as: :workout
end