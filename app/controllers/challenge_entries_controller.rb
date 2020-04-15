# frozen_string_literal: true

class ChallengeEntriesController < ApplicationController
  def new
    @challenge_entry = ChallengeEntry.new
    @challenge_entry.challenge_id = params[:challenge_id]
  end

  def create
    @challenge_entry = ChallengeEntry.new(
      challenge_entry_params.merge(user_id: current_user.id)
    )

    if @challenge_entry.save
      redirect_to challenge_path(@challenge_entry.challenge_id), success: t(
        'helpers.flash.create_success', name: 'Entry'
      )
    else
      render 'new', error: t('helpers.flash.create_error', name: 'entry')
    end
  end

  def edit
    @challenge_entry = ChallengeEntry.find(params[:id])
  end

  def update
    @challenge_entry = ChallengeEntry.find(params[:id])

    if @challenge_entry.update(challenge_entry_params)
      redirect_to challenge_path(@challenge_entry.challenge_id), success: t(
        'helpers.flash.update_success', name: 'Entry'
      )
    else
      render 'edit', error: t('helpers.flash.update_failure', name: 'entry')
    end
  end

  def destroy
    @challenge_entry = ChallengeEntry.find(params[:id])

    if @challenge_entry.destroy
      flash[:success] = t('helpers.flash.destroy_success', name: 'Entry')
    else
      flash[:error] = t('helpers.flash.destroy_failure', name: 'entry')
    end

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
