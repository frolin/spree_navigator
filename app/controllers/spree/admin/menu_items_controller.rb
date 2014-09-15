module Spree
  module Admin
    class MenuItemsController < ResourceController
      respond_to :html, :js

      def destroy
        @menu_item.destroy
        flash[:success] = Spree.t('navigator.admin.flash.success.destroy')
        respond_with(@menu_item) do |format|
          format.html { redirect_to collection_url }
          format.js   do
            render js: "window.location.href='#{admin_menu_items_path}'"
          end
        end
      end

      protected

        def set_menu_item
          @menu_item = Spree::MenuItem.find(params[:id])
        end

        def menu_item_params
          params.require(:menu_item).permit!
        end
    end
  end
end
