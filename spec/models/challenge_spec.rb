# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Challenge do
  describe '.initialize' do
    context 'unit is unset' do
      subject { FactoryBot.build(:challenge) }

      it 'assigns to "set"' do
        expect(subject.unit).to eq 'set'
      end
    end

    context 'unit is set' do
      subject { FactoryBot.build(:challenge, unit: 'rounds') }
      it 'assigns' do
        expect(subject.unit).to eq 'rounds'
      end
    end
  end
end
