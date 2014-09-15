module Spree
  module BaseHelper
    def navigator_item(item)
      link = link_to(item.name, item.url, id: "menu_item_#{item.id}", class: "menu-item")
      content_tag(:li, link)
    end
  end
end
