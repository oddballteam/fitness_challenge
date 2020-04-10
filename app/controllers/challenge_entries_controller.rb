# frozen_string_literal: true

class ChallengeEntriesController < ApplicationController
  def new
    @challenge_entry = ChallengeEntry.new
    @challenge_entry.challenge_id = params[:challenge_id]
  end

  def create
    @challenge_entry = ChallengeEntry.create(
      challenge_entry_params.merge(user_id: current_user.id)
    )
    redirect_to challenge_path(@challenge_entry.challenge_id)
  end

  def edit
    @challenge_entry = ChallengeEntry.find(params[:id])
  end

  def update
    @challenge_entry = ChallengeEntry.find(params[:id])

    if @challenge_entry.update(challenge_entry_params)
      redirect_to challenge_path(@challenge_entry.challenge_id)
    else
      render 'edit'
    end
  end

  def destroy
    @challenge_entry = ChallengeEntry.find(params[:id])
    @challenge_entry.destroy

    redirect_to challenge_path(@challenge_entry.challenge_id)
  end

  # def show
  #   @challenge = Challenge.find(params[:id])
  # end

  # private

  def challenge_entry_params
    params.require(:challenge_entry).permit(
      :amount,
      :completed_date,
      :challenge_id
    )
  end
end
