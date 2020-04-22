# frozen_string_literal: true

FactoryBot.define do
  factory :challenge do
    name { FFaker::Lorem.words(2).join(' ') }
    description { FFaker::Lorem.sentence }
    start_date { 3.days.ago }
    end_date { Date.today + 3 }
    user

    trait :with_trophy do
      trophy do
        fixture_file_upload(
          Rails.root.join(
            'spec',
            'support',
            'assets',
            'trophy.png'
          ), 'image/png'
        )
      end
    end
  end
end
