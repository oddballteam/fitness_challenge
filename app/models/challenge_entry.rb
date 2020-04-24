# frozen_string_literal: true

class ChallengeEntry < ApplicationRecord
  validates_presence_of :amount
  validates_presence_of :completed_date
  validate :validate_completed_date

  belongs_to :user
  belongs_to :challenge

  private

  def validate_completed_date
    return if challenge.nil?
    return if completed_date > challenge.start_date
    return if completed_date < challenge.end_date

    errors.add :completed_date, :should_be_during_challenge_dates
  end
end
