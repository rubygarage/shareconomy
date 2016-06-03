require 'rails_helper'

module Shareconomy
  RSpec.describe User, type: :model do
    context 'relation' do
      it { should have_many(:sent_messages).class_name(Message.name) }
      it { should have_many(:received_messages).class_name(Message.name) }
    end
  end
end
