require 'rails_helper'

describe Password do
  context '#valid?' do
    let(:password) { '' }
    let(:required_checks) { 2 }

    subject { Password.new(password, required_checks).valid? }

    context 'when password is an empty string' do
      it { expect(subject).to eq false }
    end

    context 'when password is nil' do
      let(:password) {}

      it { expect(subject).to eq false }
    end

    context 'when required_checks is set to two' do
      context 'when password must meet any two criteria' do
        context 'when password has a digit and is over 8 characters' do
          let(:password) { 'kapost1sunny' }

          it { expect(subject).to eq true }
        end

        context 'when password has an uppercase letter and is over 8 characters' do
          let(:password) { 'KapostSunny' }

          it { expect(subject).to eq true }
        end

        context 'when password has a digit and an uppercase letter' do
          let(:password) { '1Mount' }

          it { expect(subject).to eq true }
        end

        context 'when password is 8 or longer, has a digit and has an uppercase character' do
          let(:password) { '1Mountains' }

          it { expect(subject).to eq true }
        end

        context 'when password is over 8 characters' do
          let(:password) { 'kapostsunny' }

          it { expect(subject).to eq false }
        end

        context 'when password has a digit' do
          let(:password) { '5kapost' }

          it { expect(subject).to eq false }
        end
      end
    end

    context 'when required_checks is set to one' do
      let(:required_checks) { 1 }

      context 'when password has a digit' do
        let(:password) { '5kapost' }

        it { expect(subject).to eq true }
      end

      context 'when password is over 8 characters' do
        let(:password) { 'kapostsunny' }

        it { expect(subject).to eq true }
      end

      context 'when password has an uppercase character' do
        let(:password) { 'Kapost' }

        it { expect(subject).to eq true }
      end
    end
  end
end
