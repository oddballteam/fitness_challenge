# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ChallengeEntries', type: :system do
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

      first(:link, 'Add Entry').click

      fill_in I18n.t('helpers.label.challenge_entry.amount'),
              with: entry.amount
      fill_in I18n.t('helpers.label.challenge_entry.completed_date'),
              with: entry.completed_date
      click_on I18n.t('helpers.submit.challenge_entry.create')

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
        click_on I18n.t('helpers.actions.edit')
      end

      fill_in I18n.t('helpers.label.challenge_entry.amount'), with: new_amount
      click_on I18n.t('helpers.submit.challenge_entry.update')

      within "#entry-#{entry.id}" do
        expect(page).to have_text new_amount
      end
    end

    it 'delete' do
      within "#entry-#{entry.id}" do
        click_on I18n.t('helpers.actions.delete')
      end

      expect(page).to_not have_selector "#entry-#{entry.id}"
    end
  end
end
