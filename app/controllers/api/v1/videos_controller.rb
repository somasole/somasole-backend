class Api::V1::VideosController < Api::V1::ApiController
  def index
    @videos = Video.all
  end
end
