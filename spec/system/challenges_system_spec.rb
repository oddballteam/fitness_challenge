# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Challenges', type: :system do # rubocop:disable Metrics/BlockLength
  let(:user) { FactoryBot.create(:user) }
  let(:challenge) { FactoryBot.build(:challenge) }

  before(:each) do
    login_as(user, scope: :user, run_callbacks: false)
    visit root_url
    # sign_in_as(user)
  end

  it 'saves a challenge' do
    click_on 'Create Challenge'

    expect(page).to have_text 'Create a Challenge'

    fill_in 'Name', with: challenge.name
    fill_in 'Description', with: challenge.description
    fill_in 'Start date', with: challenge.start_date
    fill_in 'End date', with: challenge.end_date
    fill_in 'Unit', with: challenge.unit
    click_on 'Create Challenge'

    expect(page).to have_text challenge.name
    expect(page).to have_text challenge.description
    expect(page).to have_text challenge.start_date.strftime('%B %d, %Y')
    expect(page).to have_text challenge.end_date.strftime('%B %d, %Y')
  end

  it 'deletes a challenge' do
    FactoryBot.create(:challenge)
    visit root_url
    click_on 'Delete'

    expect(page).to_not have_text challenge.name
  end

  it 'edits a challenge' do
    FactoryBot.create(:challenge)
    new_name = FFaker::Lorem.words(2).join(' ')
    visit root_url
    click_on 'Edit'
    fill_in 'Name', with: new_name
    click_on 'Update Challenge'

    expect(page).to have_text new_name
  end

  it 'shows a challenge' do
    challenge = FactoryBot.create(:challenge)

    visit root_url

    click_on challenge.name

    expect(page).to have_text challenge.name
    expect(page).to have_text 'Add Entry'
  end
end
