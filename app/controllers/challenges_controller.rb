# frozen_string_literal: true

class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create(
      challenge_params.merge(user_id: current_user.id)
    )
    redirect_to root_path
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])

    if @challenge.update(challenge_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy

    redirect_to root_path
  end

  def show
    @challenge = Challenge.find(params[:id])
    @challenge_entries = ChallengeEntry.where(user_id: current_user.id, challenge_id: @challenge.id)
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
