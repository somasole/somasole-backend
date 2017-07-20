class FeaturedController < ApplicationController
  def index
    @articles = Article.all
    @videos = Video.all
    @workouts = Workout.all
  end

  def update_videos
    Video.update_featured! params[:featured].values

    redirect_to featured_path
  end

  def update_workout
    Workout.update_featured! [params[:workout]]

    redirect_to featured_path
  end
end
