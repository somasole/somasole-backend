class MovementsController < ApplicationController
  def create
    w = Workout.find params[:workout_id]
    w.circuits.find(params[:circuit_id]).movements.create! movement_params

    redirect_to w
  # rescue
  #   redirect_to workouts_path
  end

  def update
    Movement.find(params[:id]).update! movement_params

    redirect_to workouts_path
  rescue
    redirect_to workouts_path
  end

  def destroy
    Movement.find(params[:id]).destroy!

    redirect_to workouts_path
  rescue
    redirect_to workouts_path
  end

  private

  def movement_params
    params.require(:movement).permit(%i[time description title])
  end
end
