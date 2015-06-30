FactoryGirl.define do
  factory :menu, :class => Spree::Compose::Menu do
    sequence(:name) { |n| "Menu #{n}" }
  end
end