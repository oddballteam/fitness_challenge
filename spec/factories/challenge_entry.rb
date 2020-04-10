# frozen_string_literal: true

FactoryBot.define do
  factory :challenge_entry do
    amount { rand(100) }
    completed_date { Date.today }
    user
    challenge
  end
end
