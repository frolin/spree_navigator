FactoryGirl.define do
  factory :menu_item, class: Spree::MenuItem do
    name { Faker::Lorem.word }
    url { "http://#{Faker::Internet.domain_name}" }
    item_id 'my_menu_item'
    item_class 'my-menu-item'
    item_target '_blank'
  end
end
