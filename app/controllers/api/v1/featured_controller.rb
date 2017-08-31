class Api::V1::FeaturedController < Api::V1::ApiController
  def index
    @articles = Article.all

    @featured_videos = Video.featured

    @featured_workout = Workout.featured.first
  end
end
