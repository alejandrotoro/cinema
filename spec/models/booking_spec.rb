require 'rails_helper'

RSpec.describe Booking, type: :model do
  it 'has a valid factory' do
    expect(build(:booking)).to be_valid
  end

  describe 'validations' do
    it 'is invalid without user' do
      expect(build(:booking, user: nil)).to_not be_valid
    end
    it 'is invalid without schedule' do
      expect(build(:booking, schedule: nil)).to_not be_valid
    end
  end
end
