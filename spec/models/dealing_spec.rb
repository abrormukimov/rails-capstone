require 'rails_helper'

RSpec.describe Dealing, type: :model do
  describe 'Association tests' do
    it { should belong_to(:deal) }
    it { should belong_to(:group) }
  end
end
