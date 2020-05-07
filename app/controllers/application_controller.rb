# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :success, :error
  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :html, :json

  private

  def json_request?
    request.format.json?
  end
end
