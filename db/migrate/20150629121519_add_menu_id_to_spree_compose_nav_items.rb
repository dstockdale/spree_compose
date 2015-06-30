class AddMenuIdToSpreeComposeNavItems < ActiveRecord::Migration
  def change
    add_column :spree_compose_nav_items, :menu_id, :integer
    add_index  :spree_compose_nav_items, :menu_id
  end
end
