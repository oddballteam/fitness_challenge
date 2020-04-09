# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @challenges = Challenge.all
  end
end
