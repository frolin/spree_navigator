module Spree
  class MenuItem < ActiveRecord::Base
    validates :name, presence: true
    validates :url, presence: true

    default_scope { order(position: :asc) }
  end
end
