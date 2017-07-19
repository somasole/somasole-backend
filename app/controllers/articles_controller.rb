class ArticlesController < ApplicationController
  def update
    Article.find(params[:id]).update! article_params

    redirect_to featured_path
  rescue
    redirect_to featured_path
  end

  private

  def article_params
    params.require(:article).permit(%i[headline author body])
  end
end
