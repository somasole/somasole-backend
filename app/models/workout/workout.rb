class Workout::Workout < ApplicationRecord
  has_many :tags
  has_many :circuits
end
