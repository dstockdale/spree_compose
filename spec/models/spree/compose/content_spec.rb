require 'spec_helper'

RSpec.describe Spree::Compose::Content, type: :model do
  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:slug) }
  end
end