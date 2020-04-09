# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@oddball.io'
  layout 'mailer'
end
