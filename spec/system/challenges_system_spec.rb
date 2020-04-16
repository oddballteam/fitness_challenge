# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Challenges', type: :system do # rubocop:disable Metrics/BlockLength
  let(:user) { FactoryBot.create(:user) }

  context 'new' do
    let(:challenge) { FactoryBot.build(:challenge, user: user) }

    before(:each) do
      login_as(user, scope: :user, run_callbacks: false)
      visit root_url
    end

    it 'add' do
      click_on I18n.t('challenge.add')

      fill_in I18n.t('helpers.label.challenge.name'),
              with: challenge.name
      fill_in I18n.t('helpers.label.challenge.description'),
              with: challenge.description
      fill_in I18n.t('helpers.label.challenge.start_date'),
              with: challenge.start_date
      fill_in I18n.t('helpers.label.challenge.end_date'),
              with: challenge.end_date
      fill_in I18n.t('helpers.label.challenge.unit'),
              with: challenge.unit
      click_on I18n.t('helpers.submit.challenge.create')

      expect(page).to have_text challenge.name
      expect(page).to have_text challenge.start_date.strftime('%B %d, %Y')
      expect(page).to have_text challenge.end_date.strftime('%B %d, %Y')
    end
  end

  context 'exists' do # rubocop:disable Metrics/BlockLength
    let!(:challenge) { FactoryBot.create(:challenge, user: user) }

    before(:each) do
      login_as(user, scope: :user, run_callbacks: false)
      visit root_url
    end

    it 'edit' do
      new_name = FFaker::Lorem.words(2).join(' ')

      within "#challenge-#{challenge.id}" do
        click_on I18n.t('helpers.actions.edit')
      end

      fill_in I18n.t('helpers.label.challenge.name'), with: new_name
      click_on I18n.t('helpers.submit.challenge.update')

      expect(page).to have_text new_name
    end

    it 'delete' do
      within "#challenge-#{challenge.id}" do
        click_on I18n.t('helpers.actions.delete')
      end

      expect(page).to have_text I18n.t(
        'helpers.flash.destroy_success', name: challenge.name
      )
    end

    it 'show' do
      click_on challenge.name
      expect(page).to have_text challenge.name
    end
  end
end
