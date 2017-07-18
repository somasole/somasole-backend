class FeaturedController < ApplicationController
  def index
    @articles = Article.all
  end
end
