require 'rails_helper'

module Shareconomy
  RSpec.describe Rating, type: :model do
    context 'relation' do
      it { should belong_to(:listing) }
    end

    context 'validations' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:listing) }
      it { should validate_presence_of(:content) }
      it { should validate_presence_of(:value) }
    end
  end
end
