require 'rails_helper'

describe Shareconomy::Api::V1::Auth::SessionsController do
  routes { Shareconomy::Engine.routes }
  include_context 'shareconomy_user'

  describe 'POST #create' do
    let(:password) { Faker::Internet.password }

    it 'returns status 200', :show_in_doc do
      user.password = password
      user.save
      post :create, email: user.email, password: password
      should respond_with :ok
    end

    it 'returns status 401', :show_in_doc do
      post :create, email: Faker::Internet.email, password: password
      should respond_with :unauthorized
    end
  end

  describe 'DELETE #destroy' do
    it 'returns status 200', :show_in_doc do
      client_id = 'default'
      user.tokens[client_id] = Faker::Code.nric
      @controller.instance_variable_set(:@resource, user)
      @controller.instance_variable_set(:@client_id, client_id)

      delete :destroy
      should respond_with :ok
    end
  end
end
