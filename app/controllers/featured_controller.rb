class FeaturedController < ApplicationController
  def index
    @articles = Article.all
    @videos = Video.all
  end

  def update_videos
    Video.update_featured! params[:featured].values

    redirect_to featured_path
  end
end
