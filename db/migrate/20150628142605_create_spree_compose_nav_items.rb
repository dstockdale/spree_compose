class CreateSpreeComposeNavItems < ActiveRecord::Migration
  def change
    create_table :spree_compose_nav_items do |t|
      t.string :label
      t.string :navable_type
      t.integer :navable_id
      t.string :url
      t.integer :position
      t.string :ancestry

      t.timestamps null: false
    end
    add_index :spree_compose_nav_items, :ancestry
  end
end