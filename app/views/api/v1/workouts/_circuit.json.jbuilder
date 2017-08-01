json.extract! circuit, :sets

json.setup circuit.setup, :length, :legacy_index

json.movements circuit.movements, partial: 'api/v1/workouts/movement', as: :movement
