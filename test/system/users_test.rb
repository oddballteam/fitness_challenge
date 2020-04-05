# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'logging in' do
    visit root_url

    assert_selector 'h2', text: 'Log in'

    # fill_in 'Email', with: 'guy@gmail.com'
  end
end
