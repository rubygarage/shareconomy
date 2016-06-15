require_dependency "shareconomy/api/api_controller"

module Shareconomy
  class Api::V1::OrdersController < Api::ApiController
    before_action :set_listing, only: :create
    load_and_authorize_resource class: Order

    def sales
      render json: Shareconomy::Response.new(@orders)
    end

    def purchases
      render json: Shareconomy::Response.new(@orders)
    end

    def show
      render json: Shareconomy::Response.new(@order)
    end

    def create
      @order.buyer = current_shareconomy_user
      @order.listing = @listing
      @order.seller = @listing.user
      create_entity(@order)
    end

    private

      def set_listing
        @listing = Listing.find(params[:order][:listing_id])
        authorize! :read, @listing
      end

      def order_params
        params.require(:order).permit
      end
  end
end
