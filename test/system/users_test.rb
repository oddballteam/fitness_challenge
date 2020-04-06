# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'logging in and out' do
    user = FactoryBot.create(:user)

    visit root_url
    assert page.has_content? 'Log in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    assert page.has_content? 'Signed in successfully.'

    click_on 'Logout'

    assert page.has_content? 'Log in'
  end

  test 'signing up' do
    user = FactoryBot.build(:user)

    visit root_url
    click_on 'Sign Up'

    assert page.has_content? 'Sign up'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    assert page.has_content? 'Welcome! You have signed up successfully.'
  end

  test 'Forgot Password' do
    user = FactoryBot.create(:user)
    new_pass = FFaker::Internet.password

    visit root_url
    click_on 'Forgot Password?'

    assert page.has_content? 'Forgot Your Password?'

    fill_in 'Email', with: user.email
    click_on 'Send password reset instructions'

    assert page.has_content? 'You will receive an email with instructions on'

    # user.reload!

    visit edit_user_password_url(user.send_reset_password_instructions)

    assert page.has_content? 'Change your password'
    fill_in 'New Password', with: new_pass
    fill_in 'Confirm new password', with: new_pass
    click_on 'Change my password'
  end
end
