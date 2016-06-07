require 'rails_helper'

module Shareconomy
  RSpec.describe Api::V1::OrdersController, type: :controller do
    routes { Shareconomy::Engine.routes }
    include_context 'shareconomy_user'

    let(:seller) { create(:shareconomy_user) }
    let(:listing) { create(:shareconomy_listing, user_id: seller.id) }
    let(:order_params) { attributes_for(:shareconomy_order) }
    let(:params) do
      order_params
        .merge(listing_id: listing.id)
        .merge(buyer_id: user)
        .merge(seller_id: seller.id)
    end

    before do
      @ability = Object.new
      @ability.extend(CanCan::Ability)
      allow(controller).to receive(:current_ability).and_return(@ability)
      @ability.can :manage, :all
    end

    describe 'GET #purchases' do
      before { create_list(:shareconomy_order, 10, buyer_id: user.id, seller_id: seller.id, listing_id: listing.id) }

      it 'should be ok' do
        get :purchases, format: :json
        should respond_with :ok
      end

      it 'should contains orders', :show_in_doc do
        get :purchases, format: :json
        resp = ActiveSupport::JSON.decode(response.body)
        all_orders = resp['data']['orders']
        expect(all_orders.size).to eq 10
      end

      it "forbids to read purchased orders" do
        @ability.cannot :purchases, Order
        get :purchases, format: :json
        expect(response).to be_forbidden
      end
    end

    describe 'GET #sales' do
      before { create_list(:shareconomy_order, 10, buyer_id: seller.id, seller_id: user.id, listing_id: listing.id) }

      it 'should be ok', :show_in_doc do
        get :sales, format: :json
        should respond_with :ok
      end

      it 'should contains orders', :show_in_doc do
        get :sales, format: :json
        resp = ActiveSupport::JSON.decode(response.body)
        all_orders = resp['data']['orders']
        expect(all_orders.size).to eq 10
      end

      it "forbids to read sales orders" do
        @ability.cannot :sales, Order
        get :sales, format: :json
        expect(response).to be_forbidden
      end
    end

    describe 'GET #show' do
      let(:order) { create(:shareconomy_order) }

      it 'should return order that user bought', :show_in_doc do
        get :show, id: order.id
        should respond_with :ok
      end

      it "forbids to read order" do
        @ability.cannot :show, Order
        get :show, id: order.id, format: :json
        expect(response).to be_forbidden
      end
    end

    describe 'POST #create' do
      it 'should return status 201' do
        post :create, order: params, format: :json
        should respond_with :created
      end

      it 'can not save with invalid params', :show_in_doc do
        allow_any_instance_of(Order).to receive(:save).and_return(false)
        post :create, order: params, format: :json
        should respond_with :unprocessable_entity
      end

      it "forbids to create order" do
        @ability.cannot :create, Order
        post :create, order: params, format: :json
        expect(response).to be_forbidden
      end
    end
  end
end
