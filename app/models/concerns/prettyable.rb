module Prettyable
  extend ActiveSupport::Concern

  def created_at_pretty
    created_at.strftime('%b %-d %Y, %l:%M %p')
  end
end