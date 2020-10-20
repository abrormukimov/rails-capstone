require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation tests' do
    it { should validate_presence_of(:name) }
    it {
      should validate_presence_of(:body)
    }
  end

  describe 'Association tests' do
    it { should belong_to(:deal) }
  end
end
