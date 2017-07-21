class MovementsController < ApplicationController
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
