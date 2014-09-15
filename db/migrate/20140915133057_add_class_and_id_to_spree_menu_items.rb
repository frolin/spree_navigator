class AddClassAndIdToSpreeMenuItems < ActiveRecord::Migration
  def change
    add_column :spree_menu_items, :item_class, :string, default: nil, null: true
    add_column :spree_menu_items, :item_id, :string, default: nil, null: true

    rename_column :spree_menu_items, :target, :item_target
  end
end
