class Spree::Compose::Menu < ActiveRecord::Base
  has_many :nav_items, class_name: 'Spree::Compose::NavItem'
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :nav_items, allow_destroy: true
end
