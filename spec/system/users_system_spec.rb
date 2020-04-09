# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New User', type: :system do
  let(:user) { FactoryBot.build(:user) }

  before(:each) do
    visit root_url
    expect(page).to have_text 'Log in'
  end

  it 'signing up' do
    click_on 'Sign Up'

    expect(page).to have_text 'Sign up'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    expect(page).to have_text 'Welcome! You have signed up successfully'
  end
end

RSpec.describe 'Existing User', type: :system do # rubocop:disable Metrics/BlockLength
  let(:user) { FactoryBot.create(:user) }
  let(:new_pass) { FFaker::Internet.password }

  it 'logging in and out' do
    sign_in_as(user)
    click_on 'Logout'

    expect(page).to have_text 'Log in'
  end

  it 'Forgot Password' do
    visit root_url
    click_on 'Forgot Password?'

    expect(page).to have_text 'Forgot Your Password?'
    assert_equal ActionMailer::Base.deliveries.count, 0

    fill_in 'Email', with: user.email
    expect { click_on 'Send password reset instructions' }
      .to change { ActionMailer::Base.deliveries.count }.by(1)

    expect(page).to have_text 'You will receive an email with instructions on'

    open_email(user.email, with_subject: 'Reset password instructions')
    click_first_link_in_email

    expect(page).to have_text 'Change your password'
    fill_in 'New Password', with: new_pass
    fill_in 'Confirm new password', with: new_pass
    click_on 'Change my password'

    expect(page).to have_text 'Your password has been changed successfully'
    click_on 'Logout'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: new_pass
    click_on 'Log in'

    expect(page).to have_text 'Signed in successfully'
  end
end
