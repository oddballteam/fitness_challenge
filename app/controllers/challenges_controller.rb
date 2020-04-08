# frozen_string_literal: true

class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create(challenge_params.merge(user_id: current_user.id))
    redirect_to root_path
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy

    redirect_to root_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(
      :name,
      :description,
      :start_date,
      :end_date,
      :unit
    )
  end
end
