class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def update
    Video.find(params[:id]).update! video_params

    redirect_to videos_path
  rescue
    redirect_to videos_path
  end

  def destroy
    Video.find(params[:id]).destroy!

    redirect_to videos_path
  rescue
    redirect_to videos_path
  end

  private

  def video_params
    params.require(:video).permit(%i[youtube_id description duration title])
  end
end
