require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe 'validation tests' do
    it { should validate_presence_of(:name) }
    it {
      should validate_presence_of(:amount)
    }
  end

  describe 'Association tests' do
    it { should belong_to(:author) }
    it { should have_many(:dealings).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:groups) }
  end
end
