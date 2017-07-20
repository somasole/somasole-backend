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

require 'test_helper'

class CircuitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
