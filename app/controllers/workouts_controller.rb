class WorkoutsController < ApplicationController
  before_action :set_tags_and_setups, only: %i[index show new]

  def index
    @workouts = Workout.includes(:tags, circuits: [:setup, :movements]).all.order(:name)
  end

  def show
    @workout = Workout.find params[:id]
  end

  def new
    @workout = Workout.new
  end

  def create
    w = Workout.new workout_params
    w.tags = Tag.find params[:tags].values
    w.save!

    redirect_to w
  rescue
    redirect_to workouts_path
  end

  def update
    Workout.transaction do
      w = Workout.find params[:id]
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

  def set_tags_and_setups
    @tags = Tag.all
    @setups = Setup.all
  end
end
