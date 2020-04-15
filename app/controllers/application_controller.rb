# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :success, :error
end
