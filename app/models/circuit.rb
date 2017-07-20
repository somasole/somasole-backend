# == Schema Information
#
# Table name: circuits
#
#  id         :integer          not null, primary key
#  workout_id :integer
#  setup_id   :integer
#  sets       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Circuit < ApplicationRecord
  belongs_to :workout
  belongs_to :setup
  has_many :movements
end
