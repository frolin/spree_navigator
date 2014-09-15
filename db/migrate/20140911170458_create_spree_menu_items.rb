class CreateSpreeMenuItems < ActiveRecord::Migration
  def change
    create_table :spree_menu_items do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :target, default: nil, null: true
      t.integer :parent_id, default: nil, null: true
      t.integer :position, default: 0, null: false
      t.integer :lft
      t.integer :rgt
      t.integer :depth, default: 0, null: false
      t.timestamps
    end
  end
end
