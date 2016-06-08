require 'rails_helper'

module Shareconomy
  RSpec.describe Listing, type: :model do
    context 'relation' do
      it { should belong_to(:user) }
      it { should belong_to(:category) }
      it { should have_one(:location) }
      it { should have_many(:ratings) }
      it { should have_many(:orders) }
    end

    context 'validations' do
      it { should validate_presence_of(:user) }
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:price) }
      it { should validate_presence_of(:category) }
      it { should validate_presence_of(:description) }
    end
  end
end
