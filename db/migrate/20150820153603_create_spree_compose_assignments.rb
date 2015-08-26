class CreateSpreeComposeAssignments < ActiveRecord::Migration
  def change
    create_table :spree_compose_assignments do |t|
      t.integer :content_id
      t.string :path
      t.string :zone
      t.integer :position
      t.timestamps null: false
    end
    add_index :spree_compose_assignments, [:content_id, :path, :zone], unique: true, name: 'assignments_on_content_id_and_path_and_zone'
  end
end