FactoryBot.define do
  factory :notification do
    visiter_id { 1 }
    visited_id { 1 }
    item_id { 1 }
    message_id { 1 }
    action { 'MyString' }
    checked { false }
  end
end
