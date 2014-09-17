module Navigator
  module Renderer
    class List < SimpleNavigation::Renderer::Base
      def render(item_container)
        if item_container.level == 1
          render_top_level(item_container)
        else
          render_sub_level(item_container)
        end
      end

      protected

      def render_top_level(item_container)
        list_content(item_container).html_safe
      end

      def render_sub_level(item_container)
        if skip_if_empty? && item_container.empty?
          ''
        else
          tag        = options[:ordered] ? :ol : :ul
          content    = list_content(item_container)
          attributes = {
            id:    item_container.dom_id,
            class: item_container.dom_class
          }
          content_tag(tag, content, attributes)
        end
      end

      def list_content(item_container)
        list_content = item_container.items.inject([]) do |list, item|
          li_options = item.html_options.reject {|k, v| k == :link}
          li_content = tag_for(item)
          if include_sub_navigation?(item)
            li_content << render_sub_navigation_for(item)
          end
          list << content_tag(:li, li_content, li_options)
        end.join
      end
    end
  end
end
