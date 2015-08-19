class AddTranslationsToComposeContents < ActiveRecord::Migration
  def self.up
    Spree::Compose::Content.create_translation_table!({
      slug: :string,
      description: :string,
      keywords: :string,
      title: :string,
      body: :text
    }, { :migrate_data => true })
  end

  def self.down
    Spree::Compose::Content.drop_translation_table! migrate_data: false
  end
end
