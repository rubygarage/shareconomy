require 'rails_helper'

module Shareconomy
  RSpec.describe Order, type: :model do
    context 'relations' do
      it { should belong_to(:listing) }
      it { should belong_to(:buyer).class_name(User.name) }
      it { should belong_to(:seller).class_name(User.name) }
    end

    context 'validations' do
      it { should validate_presence_of(:buyer) }
      it { should validate_presence_of(:seller) }
      it { should validate_presence_of(:listing) }
    end

    context 'state' do
      let(:order) { create(:shareconomy_order) }

      it 'after create state is pending' do
        expect(order.pending?).to be_truthy
      end

      it 'can transition from pending to confirmed' do
        expect(order.may_confirm?).to be_truthy
      end

      it 'can transition from pending to declined' do
        expect(order.may_decline?).to be_truthy
      end

      it 'can transition from confirmed to completed' do
        order.confirm
        expect(order.may_complete?).to be_truthy
      end

      it 'can transition from confirmed to cancelled' do
        order.confirm
        expect(order.may_cancel?).to be_truthy
      end

      it 'cannot transition from pending to completed' do
        expect(order.may_complete?).to be_falsey
      end

      it 'cannot transition from declined to completed' do
        order.decline
        expect(order.may_complete?).to be_falsey
      end

      it 'cannot transition from cancelled to completed' do
        order.confirm
        order.cancel
        expect(order.may_complete?).to be_falsey
      end

      it 'cannot transition from confirmed to declined' do
        order.confirm
        expect(order.may_decline?).to be_falsey
      end

      it 'cannot transition from confirmed to cancelled' do
        order.confirm
        expect(order.may_cancel?).to be_truthy
      end
    end

    context 'callbacks' do
      it 'updates total price before save' do
        order = build(:shareconomy_order)
        expect(order).to receive(:update_total_price)
        order.save
      end
    end
  end
end
