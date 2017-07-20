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

class Workout < ApplicationRecord
  include Featurable

  has_and_belongs_to_many :tags
  has_many :circuits
end