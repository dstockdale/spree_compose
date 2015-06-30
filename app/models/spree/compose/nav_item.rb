class Spree::Compose::NavItem < ActiveRecord::Base
  belongs_to :menu, class_name: 'Spree::Compose::Menu'
end
