module Featurable
  extend ActiveSupport::Concern

  class_methods do
    def featured
      where(featured: true)
    end

    def update_featured!(new_featured)
      transaction do
        featured.each { |o| o.update! featured: false }
        find(new_featured).each { |o| o.update! featured: true }
      end
    end
  end
end