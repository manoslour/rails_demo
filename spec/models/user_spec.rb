require 'rails_helper'

RSpec.describe User, type: :model do
  before { subject.save }

  context 'when valid' do
    subject { build(:user) }

    it 'persists' do
      expect(subject).to be_persisted
    end

    it 'does not have errors' do
      expect(subject.errors).to be_blank
    end
  end

  context 'when invalid' do
    subject { build(:user, :invalid) }

    it 'does not persist' do
      expect(subject).not_to be_persisted
    end

    it 'does have errors' do
      expect(subject.errors).not_to be_blank
    end
  end
end
