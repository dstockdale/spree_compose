require 'spree_core'
require 'spree_compose/engine'

class Spree::StaticPage
  def self.matches?(request)
    return false if request.path =~ /(^\/+(admin|account|cart|checkout|content|login|pg\/|orders|products|s\/|session|signup|shipments|states|t\/|tax_categories|user)+)/
    !Spree::Compose::Content.visible.find_by_slug(request.path).nil?
  end
end