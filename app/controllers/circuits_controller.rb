class CircuitsController < ApplicationController
  def update
    c = Circuit.find(params[:id])
    c.setup = Setup.find params[:setup]
    c.update! circuit_params

    redirect_to workouts_path
  rescue
    redirect_to workouts_path
  end

  private

  def circuit_params
    params.require(:circuit).permit(%i[sets])
  end
end
