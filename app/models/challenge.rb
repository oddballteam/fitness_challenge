# frozen_string_literal: true

class Challenge < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :start_date
  validates_presence_of :end_date

  belongs_to :user

  after_initialize :init

  def init
    self.unit ||= 'set'
  end
end
