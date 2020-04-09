# frozen_string_literal: true

FactoryBot.define do
  factory :challenge do
    name { FFaker::Lorem.words(2).join(' ') }
    description { FFaker::Lorem.sentence }
    start_date { 3.days.ago }
    end_date { Date.today + 3 }
    unit { 'rounds' }
    user
  end
end
