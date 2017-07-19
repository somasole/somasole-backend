module Featurable
  extend ActiveSupport::Concern

  included do
    scope :featured, -> { where(featured: true) }
  end

  def feature!
    update! featured: true
  end

  def unfeature!
    update! featured: false
  end

  class_methods do
    def update_featured!(new_featured)
      transaction do
        featured.each(&:unfeature!)
        find(new_featured).each(&:feature!)
      end
    end
  end
end