# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ChallengeEntries', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:challenge) { FactoryBot.create(:challenge, user: user) }
  let(:amount) { rand(100) }

  before(:each) do
    login_as(user, scope: :user, run_callbacks: false)
    visit root_url
  end

  it 'adds an entry' do
    date = Date.today

    click_on challenge.name

    click_on 'Add Entry'

    fill_in 'Amount', with: amount
    fill_in 'Completed date', with: date
    click_on 'Create Challenge entry'

    expect(page).to have_text amount
    expect(page).to have_text date
  end

  context 'entry exists' do
    let!(:entry) { FactoryBot.create(:challenge_entry, challenge: challenge) }

    it 'edits an entry' do
      visit challenge_path(challenge)
      expect(page).to have_text entry.amount

      within "#entry-#{entry.id}" do
        click_on 'Edit'
        fill_in 'Amount', with: amount
        click_on 'Update Challenge entry'

        expect(page).to have_text amount
      end
    end

    it 'deletes an entry' do
    end
  end
end
