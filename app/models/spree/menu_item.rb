module Spree
  class MenuItem < ActiveRecord::Base
    # belongs_to :parent,
    #             foreign_key: :parent_id,
    #             class_name: 'Spree::Menu'
    # has_many :children,
    #           class_name: 'Spree::Menu',
    #           foreign_key: :parent_id,
    #           dependent: :destroy

    validates :name, presence: true
    validates :url, presence: true

    default_scope { order(position: :asc) }
  end
end
