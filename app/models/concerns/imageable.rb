require 'shrine'

module Imageable
  extend ActiveSupport::Concern

  class ImageUploader < Shrine
    # plugins and uploading logic
  end
end