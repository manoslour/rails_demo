require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  it 'is valid' do
    expect(subject).to be_valid
  end
end
