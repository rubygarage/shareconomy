require 'rails_helper'

module Shareconomy
  RSpec.describe Location, type: :model do
    context 'relation' do
      it { should belong_to(:listing) }
    end

    context 'validations' do
      it { should validate_presence_of(:state) }
      it { should validate_presence_of(:city) }
      it { should validate_presence_of(:district) }
      it { should validate_presence_of(:street) }
      it { should validate_presence_of(:zip_code) }
      it { should validate_presence_of(:listing) }
    end
  end
end
