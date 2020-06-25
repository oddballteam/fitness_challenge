# frozen_string_literal: true

FactoryBot.define do
  factory :challenge_entry do
    amount { rand(100) }
    completed_date { rand(challenge.start_date..challenge.end_date) }
    user
    challenge
  end
end
