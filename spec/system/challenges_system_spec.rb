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
      click_on 'Create Challenge'

      expect(page).to have_text 'Create a Challenge'

      fill_in 'Name', with: challenge.name
      fill_in 'Description', with: challenge.description
      fill_in 'Start date', with: challenge.start_date
      fill_in 'End date', with: challenge.end_date
      fill_in 'Unit', with: challenge.unit
      click_on 'Create Challenge'

      expect(page).to have_text challenge.name
      expect(page).to have_text challenge.start_date.strftime('%B %d, %Y')
      expect(page).to have_text challenge.end_date.strftime('%B %d, %Y')
    end
  end

  context 'exists' do
    let!(:challenge) { FactoryBot.create(:challenge, user: user) }

    before(:each) do
      login_as(user, scope: :user, run_callbacks: false)
      visit root_url
    end

    it 'edit' do
      new_name = FFaker::Lorem.words(2).join(' ')

      within "#challenge-#{challenge.id}" do
        click_on 'Edit'
      end

      fill_in 'Name', with: new_name
      click_on 'Update Challenge'

      expect(page).to have_text new_name
    end

    it 'delete' do
      within "#challenge-#{challenge.id}" do
        click_on 'Delete'
      end

      expect(page).to_not have_text challenge.name
    end

    it 'show' do
      click_on challenge.name

      expect(page).to have_text challenge.name
      expect(page).to have_text 'Add Entry'
    end
  end
end
