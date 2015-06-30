require 'spec_helper'

RSpec.describe Spree::Compose::Menu, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:nav_items) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to accept_nested_attributes_for(:nav_items).allow_destroy(true) }
  end
end
