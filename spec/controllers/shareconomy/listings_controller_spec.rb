require 'rails_helper'

module Shareconomy
  RSpec.describe ListingsController, type: :controller do
    routes { Shareconomy::Engine.routes }

    context 'GET #index' do
      it 'should contains listings', :show_in_doc do
        create_list(:shareconomy_listing, 10)
        get :index, format: :json
        resp = ActiveSupport::JSON.decode(response.body)
        all_listings = resp['listings']
        expect(all_listings.size).to eq 10
      end
    end

    context 'GET #new' do
      it 'should be ok', :show_in_doc do
        get :new, listing: attributes_for(:shareconomy_listing), format: :json
        should respond_with :ok
      end
    end

    context 'GET #show' do
      let(:listing) { create(:shareconomy_listing) }

      it 'should be ok', :show_in_doc do
        get :show, id: listing.id, format: :json
        should respond_with :ok
      end
    end
  end
end
