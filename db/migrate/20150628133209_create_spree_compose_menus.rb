class CreateSpreeComposeMenus < ActiveRecord::Migration
  def change
    create_table :spree_compose_menus do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
