# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ChallengeEntries', type: :system do # rubocop:disable Metrics/BlockLength
  let(:user) { FactoryBot.create(:user) }
  let!(:challenge) { FactoryBot.create(:challenge, user: user) }

  context 'new' do
    let(:entry) do
      FactoryBot.build(:challenge_entry, challenge: challenge, user: user)
    end

    before(:each) do
      login_as(user, scope: :user, run_callbacks: false)
      visit root_url
    end

    it 'add' do
      click_on challenge.name

      click_on 'Add Entry'

      fill_in 'Amount', with: entry.amount
      fill_in 'Completed date', with: entry.completed_date
      click_on 'Create Challenge entry'

      expect(page).to have_text entry.amount
      expect(page).to have_text entry.completed_date
    end
  end

  context 'exists' do
    let(:new_amount) { rand(100) }
    let!(:entry) do
      FactoryBot.create(:challenge_entry, challenge: challenge, user: user)
    end

    before(:each) do
      login_as(user, scope: :user, run_callbacks: false)
      visit challenge_path(challenge)
    end

    it 'edit' do
      within "#entry-#{entry.id}" do
        click_on 'Edit'
      end

      fill_in 'Amount', with: new_amount
      click_on 'Update Challenge entry'

      within "#entry-#{entry.id}" do
        expect(page).to have_text new_amount
      end
    end

    it 'delete' do
      within "#entry-#{entry.id}" do
        click_on 'Delete'
      end

      expect(page).to_not have_selector "#entry-#{entry.id}"
    end
  end
end
