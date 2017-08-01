class Api::V1::VideosController < ApplicationController
  def index
    @videos = Video.all
  end
end
