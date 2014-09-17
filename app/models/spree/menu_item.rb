module Spree
  class MenuItem < ActiveRecord::Base
    before_create :set_item_position

    belongs_to :parent,
                foreign_key: :parent_id,
                class_name: 'Spree::MenuItem'
    has_many :children,
              class_name: 'Spree::MenuItem',
              foreign_key: :parent_id,
              dependent: :destroy

    validates :name, presence: true
    validates :url, presence: true

    default_scope { order(position: :asc) }

    scope :top_level, -> { where(parent_id: nil) }

    private

      def set_item_position
        self.position = MenuItem.where(parent_id: self.parent_id).count
      end
  end
end
