# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Challenges', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:challenge) { FactoryBot.build(:challenge) }

  before(:each) do
    sign_in_as(user)
  end

  it 'saves and displays the challenge' do
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
    challenge = FactoryBot.create(:challenge)
    visit root_url
    expect(page).to have_text challenge.name

    click_on 'Delete'

    expect(page).to_not have_text challenge.name
  end
end
