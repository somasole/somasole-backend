# == Schema Information
#
# Table name: workouts
#
#  id          :integer          not null, primary key
#  name        :string
#  time        :integer
#  intensity   :integer
#  description :text
#  featured    :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
