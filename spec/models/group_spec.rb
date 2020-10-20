require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validation tests' do
    it {
      should validate_length_of(:name)
    }
  end

  describe 'Association tests' do
    it { should belong_to(:user) }
    it { should have_many(:deals) }
    it { should have_many(:dealings).dependent(:destroy) }
  end
end
