require 'rails_helper'

describe Shareconomy::Api::V1::Auth::RegistrationsController do
  routes { Shareconomy::Engine.routes }

  describe 'POST #create' do
    let(:user) { create(:shareconomy_user) }

    let(:params) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      }
    end

    before do
      request.env['devise.mapping'] = Devise.mappings[:shareconomy_user]
      allow(@controller).to receive(:current_shareconomy_user).and_return(user)
    end


    it 'should return 201', :show_in_doc do
      post :create, params
      should respond_with :created
    end

    it 'should create a new user' do
      expect { post :create, params }.to change { Shareconomy::User.count }.by(1)
    end

    context 'email already in use' do
      it 'returns 403', :show_in_doc do
        create(:shareconomy_user, email: params[:email])

        post :create, params
        should respond_with :forbidden
      end
    end
  end
end
