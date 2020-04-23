# frozen_string_literal: true

class ChallengeEntry < ApplicationRecord
  validates_presence_of :amount
  validates_presence_of :completed_date

  validates_date :completed_date, between: %i[start_date end_date]

  belongs_to :user
  belongs_to :challenge
end
