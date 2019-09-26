require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a valid factory' do
    expect(build(:movie)).to be_valid
  end

  describe 'validations' do
    it 'is invalid without name' do
      expect(build(:movie, name: nil)).to_not be_valid
    end
    it 'is invalid without description' do
      expect(build(:movie, description: nil)).to_not be_valid
    end
  end
end
