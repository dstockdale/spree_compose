class Spree::Compose::Content < ActiveRecord::Base

  has_many :assignments

  accepts_nested_attributes_for :assignments, allow_destroy: true, reject_if: proc { |attributes| attributes['zone'].blank? }

  scope :visible, -> { where(visible: true) }
  scope :pages, -> { where(content_type: 'Page') }
  scope :snippets, -> { where(content_type: 'Snippet') }
  scope :posts, -> { where(content_type: 'Post') }

  validates :slug, uniqueness: true

  translates :body, :slug, :description, :keywords, :title, fallbacks_for_empty_translations: true
  include SpreeI18n::Translatable

  # Allow to filter products through their translations, too
  def self.like_any(fields, values)
    translations = Spree::Compose::Content::Translation.arel_table

    joins(:translations).where(fields.map { |field|
      values.map { |value|
        translations[field].matches("%#{value}%").        # extension: match with translations under current locale
          or(arel_table[field].matches("%#{value}%"))     # compatible with original behaviour
      }.inject(:or)
    }.inject(:or).and(translations[:locale].eq(I18n.locale)))
  end

  def duplicate_extra(old_content)
    duplicate_translations(old_content)
  end

  def link
    slug.index('/') == 0 ? slug : '/' + slug
  end

  def is_page?
    content_type == "Page"
  end

end
