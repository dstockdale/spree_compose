class CreateSpreeComposeContents < ActiveRecord::Migration
  def change
    create_table :spree_compose_contents do |t|
      t.string :slug
      t.boolean :visible, default: true
      t.string :content_type, default: "Page"
      t.text :description
      t.string :keywords
      t.string :title
      t.text :body
      t.integer :subject_id
      t.string :template
      t.string :ancestry
      t.integer :position
      t.datetime :display_from, null: true
      t.datetime :display_till, null: true

      t.timestamps null: false
    end
    add_index :spree_compose_contents, :ancestry
  end
end
