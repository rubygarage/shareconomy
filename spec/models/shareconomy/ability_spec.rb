require 'rails_helper'
require 'cancan/matchers'

module Shareconomy
  RSpec.describe Ability, type: :model do
    subject { Ability.new(user) }

    describe 'for guest' do
      let(:user) { nil }

      it { should be_able_to(:read, Listing) }
    end

    describe 'for user' do
      let(:user) { create(:shareconomy_user) }

      context 'order' do
        let(:order1) { create(:shareconomy_order, buyer_id: user.id) }
        let(:order2) { create(:shareconomy_order, seller_id: user.id) }
        let(:other_order) { create(:shareconomy_order) }

        it { should be_able_to(:create, Order, buyer_id: user.id) }

        it { should be_able_to(:show, order1, buyer_id: user.id)}
        it { should_not be_able_to(:show, other_order, buyer_id: user.id) }

        it { should be_able_to(:sales, order1, buyer_id: user.id) }
        it { should_not be_able_to(:sales, other_order, buyer_id: user.id)}

        it { should be_able_to(:purchases, order2, seller_id: user.id)}
        it { should_not be_able_to(:purchases, other_order, seller_id: user.id)}
      end
    end
  end
end
