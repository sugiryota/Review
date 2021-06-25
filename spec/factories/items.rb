FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    text { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 2..6) }
    audio { File.open("#{Rails.root}/spec/fixtures/voice/music.mp3") }
    minicategory { Faker::Lorem.word }
    association :user
    url { 'hhhh.com' }
    impressions_count { 123 }
    after(:build) do |user|
      user.image.attach(io: File.open('public/images/maic.png'), filename: 'test_image.png')
    end
  end
end
