require 'rails_helper'

module Shareconomy
  RSpec.describe User, type: :model do
    context 'relation' do
      it { should have_many(:sent_messages).class_name(Message.name) }
      it { should have_many(:received_messages).class_name(Message.name) }
      it { should have_many(:sales).class_name(Order.name) }
      it { should have_many(:purchases).class_name(Order.name) }
    end
  end
end
