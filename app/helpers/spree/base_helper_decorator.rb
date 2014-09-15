module Spree
  module BaseHelper
    def navigator_item(item)
      link = link_to(Spree.t(:home), spree.root_path)

      content_tag(:li, link)
    end
  end
end
