class Api::V1::FeaturedController < ApplicationController
  def index
    @articles = Article.all

    @featured_videos = Video.featured

    @featured_workout = Workout.featured.first
  end
end
