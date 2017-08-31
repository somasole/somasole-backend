class Api::V1::WorkoutsController < Api::V1::ApiController
  def index
    @workouts = Workout.all.order(:name)
  end
end
