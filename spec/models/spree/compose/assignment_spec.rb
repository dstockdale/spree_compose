require 'spec_helper'

RSpec.describe Spree::Compose::Assignment, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:content) }
  end
end
