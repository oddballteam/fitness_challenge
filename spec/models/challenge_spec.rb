# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Challenge do
  let(:user) { FactoryBot.create(:user) }
  subject { FactoryBot.build(:challenge) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a start_date' do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a end_date' do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end

  it { should belong_to(:user).without_validating_presence }
end
