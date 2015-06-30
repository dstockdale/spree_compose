require 'spec_helper'

RSpec.describe Spree::Compose::NavItem, type: :model do
  
  describe "associations" do
    it { is_expected.to belong_to(:menu) }
  end

  describe "validations" do
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_uniqueness_of(:name) }
    # it { is_expected.to accept_nested_attributes_for(:nav_items).allow_destroy(true) }
  end

end
