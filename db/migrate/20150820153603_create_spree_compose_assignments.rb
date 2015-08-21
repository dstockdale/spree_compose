class CreateSpreeComposeAssignments < ActiveRecord::Migration
  def change
    create_table :spree_compose_assignments do |t|
      t.integer :content_id
      t.string :path
      t.integer :position
      t.timestamps null: false
    end
    add_index :spree_compose_assignments, :path
    add_index :spree_compose_assignments, :content_id
  end
end
