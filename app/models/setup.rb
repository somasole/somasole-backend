# == Schema Information
#
# Table name: setups
#
#  id           :integer          not null, primary key
#  length       :integer
#  legacy_index :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Setup < ApplicationRecord
  has_many :circuits

  def name
    "Setup #{legacy_index} #{length == 0 ? 'Short' : 'Long'}"
  end
end
