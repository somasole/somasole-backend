# == Schema Information
#
# Table name: movements
#
#  id          :integer          not null, primary key
#  circuit_id  :integer
#  time        :integer
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Movement < ApplicationRecord
  belongs_to :circuit
end
