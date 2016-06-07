require 'rails_helper'

describe Shareconomy::Api::V1::Auth::RegistrationsController do
  routes { Shareconomy::Engine.routes }
  include_context 'shareconomy_user'

  describe 'POST #create' do
    let(:params) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      }
    end

    it 'should return 201', :show_in_doc do
      post :create, params
      should respond_with :created
    end

    it 'should create a new user' do
      expect { post :create, params }.to change { Shareconomy::User.count }.by(1)
    end

    it 'should create profile with given params', :show_in_doc do
      post :create, params
      profile = Shareconomy::Profile.last
      expect(profile.first_name).to eq params[:first_name]
      expect(profile.last_name).to eq params[:last_name]
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
