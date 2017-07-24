# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  author     :string
#  headline   :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
  include Imageable::ImageUploader::Attachment.new(:text_image)
  include Imageable::ImageUploader::Attachment.new(:plain_image)
end
