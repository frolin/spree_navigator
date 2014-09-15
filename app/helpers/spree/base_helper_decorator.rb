module Spree
  module BaseHelper
    def navigator_item(item)
      options = {
        id:     item.item_id || nil,
        class:  item.item_class || nil,
        target: item.item_target || nil
      }
      link = link_to(item.name, item.url, options.compact!)
      content_tag(:li, link)
    end

    def navigator_home_item
      navigator_item(Spree::MenuItem.new(
        id:   0,
        name: Spree.t(:home),
        url:  root_path
      ))
    end
  end
end
