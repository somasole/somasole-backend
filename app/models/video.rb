# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  youtube_id  :string
#  description :text
#  duration    :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Video < ApplicationRecord
end
