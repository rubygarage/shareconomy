require 'rails_helper'

module Shareconomy
  RSpec.describe Category, type: :model do
    context 'relation' do
      it { should have_many(:listings) }
    end

    context 'validations' do
      it { should validate_presence_of(:title) }
    end
  end
end
