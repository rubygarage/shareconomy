require 'rails_helper'

module Shareconomy
  RSpec.describe Message, type: :model do
    context 'relation' do
      it { should belong_to(:sender).class_name(User.name) }
      it { should belong_to(:recipient).class_name(User.name) }
    end

    context 'validations' do
      it { should validate_presence_of(:body) }
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:sender) }
      it { should validate_presence_of(:recipient) }
    end
  end
end
