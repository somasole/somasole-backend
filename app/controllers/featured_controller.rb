class FeaturedController < ApplicationController
  def index
    @articles = Article.all

    @videos = Video.all
    @featured_videos = @videos.featured

    @workouts = Workout.all
    @featured_workout = @workouts.featured.first
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
