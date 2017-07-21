class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all.order(:name)
    @tags = Tag.all
    @setups = Setup.all
  end

  def update
    w = Workout.find(params[:id])
    w.tags = Tag.find params[:tags].values
    w.update! workout_params

    redirect_to workouts_path
  rescue
    redirect_to workouts_path
  end

  def destroy
    Workout.find(params[:id]).destroy!

    redirect_to workouts_path
  rescue
    redirect_to workouts_path
  end

  private

  def workout_params
    params.require(:workout).permit(%i[name time intensity description])
  end
end
