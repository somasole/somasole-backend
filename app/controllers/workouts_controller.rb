class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all.order(:name)
    @tags = Tag.all
    @setups = Setup.all
  end

  def new
    @workout = Workout.new
    @tags = Tag.all
  end

  def create
    Workout.transaction do
      w = Workout.create! workout_params
      w.tags = Tag.find params[:tags].values
    end

    redirect_to workouts_path
  rescue
    redirect_back
  end

  def update
    Workout.transaction do
      w = Workout.find(params[:id])
      w.tags = Tag.find params[:tags].values
      w.update! workout_params
    end

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
    params.require(:workout).permit(%i[name time intensity description image])
  end
end
