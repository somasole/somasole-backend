json.extract! workout, :name, :time, :intensity, :description

json.circuits workout.circuits, partial: 'workouts/circuit', as: :circuit
