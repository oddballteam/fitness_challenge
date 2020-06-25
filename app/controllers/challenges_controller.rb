# frozen_string_literal: true

class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(
      challenge_params.merge(user_id: current_user.id)
    )

    if @challenge.save
      redirect_to root_path, success: t(
        'helpers.flash.create_success', name: @challenge.name
      )
    else
      render 'new', error: t('helpers.flash.create_error', name: 'challenge')
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])

    if @challenge.update(challenge_params)
      redirect_to root_path, success: t(
        'helpers.flash.update_success', name: @challenge.name
      )
    else
      render 'edit', error: t('helpers.flash.update_failure', name: 'challenge')
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])

    if @challenge.destroy
      flash[:success] = t(
        'helpers.flash.destroy_success', name: @challenge.name
      )
    else
      flash[:error] = t('helpers.flash.destroy_failure', name: 'challenge')
    end

    redirect_to root_path
  end

  def show
    @challenge = Challenge.find(params[:id])
    @challenge_entries = ChallengeEntry.where(
      user_id: current_user.id,
      challenge_id: @challenge.id
    )
    @challenge_todays_entries = ChallengeEntry.where(
      challenge_id: @challenge.id,
      completed_date: Date.today
    ).order('amount DESC')
  end

  private

  def challenge_params
    params.require(:challenge).permit(
      :name,
      :description,
      :start_date,
      :end_date,
      :unit,
      :trophy
    )
  end
end
