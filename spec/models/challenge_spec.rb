# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Challenge do
  describe '.init' do
    context 'unit is unset' do
      subject { FactoryBot.build(:challenge, unit: nil) }

      it 'init sets default unit to "set"' do
        expect(subject.unit).to eq 'set'
      end
    end

    context 'unit is set' do
      subject { FactoryBot.build(:challenge) }
      it 'init sets unit' do
        expect(subject.unit).to eq 'rounds'
      end
    end
  end
end
