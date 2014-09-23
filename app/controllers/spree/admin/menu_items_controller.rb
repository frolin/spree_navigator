module Spree
  module Admin
    class MenuItemsController < BaseController
      before_action :set_menu_item, only: [:edit, :update, :destroy, :children]

      def index
        @menu_items = Spree::MenuItem.top_level
        respond_to do |format|
          format.html
          format.json { render :children, status: :ok }
        end
      end

      def new
        @menu_item = Spree::MenuItem.new
      end

      def create
        @menu_item = Spree::MenuItem.new(menu_item_params)

        respond_to do |format|
          if @menu_item.save
            format.html {
              scope = 'navigator.admin.flash.success'
              redirect_to admin_menu_items_path, flash: {
                success: Spree.t(:create, name: @menu_item.name, scope: scope)
              }
            }
            format.json { render :show, status: :created }
          else
            format.html { render :new }
            format.json {
              render json: @menu_item.errors, status: :unprocessable_entity
            }
          end
        end
      end

      def edit
      end

      def update
        respond_to do |format|
          if @menu_item.update(menu_item_params)
            organize_items
            format.html {
              scope = 'navigator.admin.flash.success'
              redirect_to admin_menu_items_path, flash: {
                success: Spree.t(:update, name: @menu_item.name, scope: scope)
              }
            }
            format.json { render :show, status: :created }
          else
            format.html { render :edit }
            format.json {
              render json: @menu_item.errors, status: :unprocessable_entity
            }
          end
        end
      end

      def destroy
        @menu_item.destroy
        respond_to do |format|
          format.html {
            redirect_to admin_menu_items_path, flash: {
              success: Spree.t('navigator.admin.flash.success.destroy')
            }
          }
          format.json { head :no_content }
        end
      end

      def children
        @menu_items = Spree::MenuItem.find(params[:id]).children
        respond_to do |format|
          format.json { render :children, status: :ok }
        end
      end

      protected

        def set_menu_item
          @menu_item = Spree::MenuItem.find(params[:id])
        end

        def permitted_menu_item_attributes
          [
            :name,
            :url,
            :item_id,
            :item_class,
            :item_target,
            :parent_id,
            :position
          ]
        end

        def menu_item_params
          if params[:menu_item][:parent_id] == 'menu_tree'
            params[:menu_item][:parent_id] = nil
          end
          params.require(:menu_item).permit(permitted_menu_item_attributes)
        end

        def organize_items
          items = Spree::MenuItem.where(parent_id: menu_item_params[:parent_id])
                          .order(updated_at: :desc)
                          .map(&:id)
          items.each_with_index do |id, index|
            Spree::MenuItem.find(id).update_attributes(position: index)
          end
        end
    end
  end
end
