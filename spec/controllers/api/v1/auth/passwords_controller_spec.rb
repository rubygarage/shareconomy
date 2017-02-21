require 'rails_helper'

describe Shareconomy::Api::V1::Auth::PasswordsController do
  routes { Shareconomy::Engine.routes }
  include_context 'shareconomy_user'

  describe 'POST #create' do
    xit 'returns status 200', :show_in_doc do
      post :create, email: user.email, redirect_url: Faker::Internet.url
      should respond_with :ok
    end
  end

  describe 'PUT #password' do
    let(:password) { Faker::Internet.password }
    let(:current_password) { Faker::Internet.password }

    before do
      user.password = current_password
      auth_headers = user.create_new_auth_token
      request.headers.merge!(auth_headers)
    end

    xit 'returns status 200', :show_in_doc do
      put :update, password: password, password_confirmation: password, current_password: current_password
      should respond_with :ok
    end

    xit 'returns status 422', :show_in_doc do
      put :update, password: password, password_confirmation: password
      should respond_with :unprocessable_entity
    end
  end
end
