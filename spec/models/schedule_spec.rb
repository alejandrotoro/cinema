require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it 'has a valid factory' do
    expect(build(:schedule)).to be_valid
  end
end
