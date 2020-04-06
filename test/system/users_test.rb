# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'logging in' do
    user = FactoryBot.create(:user)

    visit root_url
    assert page.has_content? 'Log in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    assert page.has_content? 'Home'
  end
end
