class Api::V1::WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all.order(:name)
  end
end
