module Spree::Compose
  def self.table_name_prefix
    'spree_compose_'
  end
  def self.use_relative_model_naming?
    true
  end
end
