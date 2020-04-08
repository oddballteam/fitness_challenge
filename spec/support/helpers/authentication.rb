# frozen_string_literal: true

module Helpers
  module Authentication
    def sign_in_as(user)
      visit root_url
      expect(page).to have_text 'Log in'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'

      expect(page).to have_text 'Signed in successfully'
    end
  end
end
