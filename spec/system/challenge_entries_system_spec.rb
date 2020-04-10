# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ChallengeEntries', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    sign_in_as(user)
  end

  it 'adds an entry' do
    challenge = FactoryBot.create(:challenge)
    amount = rand(100)
    date = Date.today

    visit root_url
    click_on challenge.name

    click_on 'Add Entry'

    fill_in 'Amount', with: amount
    fill_in 'Completed date', with: date
    click_on 'Create Challenge entry'

    expect(page).to have_text amount
    expect(page).to have_text date
  end

  it 'edits an entry' do
    challenge = FactoryBot.create(:challenge)
    entry = FactoryBot.create(:challenge_entry, challenge: challenge)
    amount = rand(100)

    visit root_url
    click_on challenge.name
    # expect(page).to have_text entry.amount
    expect(page).to have_css('.amount', text: entry.amount)

    click_on 'Edit'
    fill_in 'Amount', with: amount
    click_on 'Update'

    expect(page).to have_text amount
  end

  it 'deletes an entry' do
  end
end
