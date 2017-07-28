class CircuitsController < ApplicationController
  def create
    w = Workout.find params[:workout_id]
    c = w.circuits.build circuit_params
    c.setup = Setup.find params[:setup]
    c.save!

    redirect_to w
  rescue
    redirect_to workouts_path
  end

  def update
    c = Circuit.find(params[:id])
    c.setup = Setup.find params[:setup]
    c.update! circuit_params

    redirect_to workouts_path
  rescue
    redirect_to workouts_path
  end

  def destroy
    Circuit.find(params[:id]).destroy!

    redirect_to workouts_path
  rescue
    redirect_to workouts_path
  end

  private

  def circuit_params
    params.require(:circuit).permit(%i[sets])
  end
end
