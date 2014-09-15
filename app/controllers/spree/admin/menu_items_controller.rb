module Spree
  module Admin
    class MenuItemsController < ResourceController
      def show
        redirect_to(action: :edit)
      end

      # def update_positions
      #   puts params
      #   params[:positions].each do |id, index|
      #     Spree::Menu.update_all(['position=?', index], ['id=?', id])
      #   end
      #
      #   respond_to do |format|
      #     format.html { redirect_to(admin_menu_items_path) }
      #     format.js   { render text: 'Ok' }
      #   end
      # end
    end
  end
end
