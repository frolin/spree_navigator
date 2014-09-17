module Spree
  module BaseHelper
    def navigator_menu
      menu_items = Spree::MenuItem.top_level
      if menu_items.any?
        navigator_levels(menu_items)
      else
        navigator_default
      end
    end

    protected

      def navigator_levels(menu_items)
        items = []
        menu_items.each do |menu_item|
          item = navigator_item(menu_item)

          if menu_item.parent_id.present?
            item[:options] = {
              container_class: "menu-children"
            }
          end

          if menu_item.children.any?
            item[:items] = navigator_levels(menu_item.children)
          end

          items << item
        end
        items
      end

      def navigator_default
        [
          navigator_item(Spree::MenuItem.new(
            id:   0,
            name: Spree.t(:home),
            url:  '/'
          ))
        ]
      end

      def navigator_item(item)
        {
          key:     item.id,
          name:    item.name,
          url:     item.url,
          options: {
            id:    "menu_item_#{item.id}",
            class: "menu-item menu-item-#{item.id}"
          },
          link: {
            target: item.item_target || nil,
            class:  item.item_class || nil,
            id:     item.item_id || nil
          }
        }
      end
  end
end
