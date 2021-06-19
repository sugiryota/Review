FactoryBot.define do
  factory :message do
    comment {Faker::Lorem.sentence}
    audiocomment { File.open("#{Rails.root}/spec/fixtures/voice/music.mp3") }
    association :user
    association :item
  end
end
