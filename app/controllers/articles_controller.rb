class ArticlesController < ApplicationController
  def show
    @article = Article.find params[:id]
  end

  def new
    @article = Article.new
  end

  def create
    Article.create! article_params

    redirect_to featured_path
  rescue
    redirect_back
  end

  def update
    Article.find(params[:id]).update! article_params

    redirect_to featured_path
  rescue
    redirect_to featured_path
  end

  def destroy
    Article.find(params[:id]).destroy!

    redirect_to featured_path
  rescue
    redirect_to featured_path
  end

  private

  def article_params
    params.require(:article).permit(%i[headline author body text_image plain_image])
  end
end
