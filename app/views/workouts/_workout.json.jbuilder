json.extract! workout, :name, :time, :intensity, :description, :image_url

json.circuits workout.circuits, partial: 'workouts/circuit', as: :circuit
