json.extract! workout, :name, :time, :intensity, :description, :image_url

json.circuits workout.circuits, partial: 'api/v1/workouts/circuit', as: :circuit

json.tags workout.tags, partial: 'api/v1/workouts/tag', as: :tag
