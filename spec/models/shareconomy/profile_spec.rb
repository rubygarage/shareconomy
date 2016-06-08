require 'rails_helper'

module Shareconomy
  RSpec.describe Profile, type: :model do
    context 'relation' do
      it { should belong_to(:user) }
    end

    context 'validations' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
    end
  end
end
