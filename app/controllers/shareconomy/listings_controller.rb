require_dependency "shareconomy/application_controller"

module Shareconomy
  class ListingsController < ApplicationController
    def index
      @listings = Listing.all
      render json: @listings
    end

    def new
      @listing = Listing.new(listing_params)
      render json: @listing
    end

    def show
      @listing = Listing.find(params[:id])
      render json: @listing
    end

    private

      def listing_params
        params.require(:listing).permit(:title, :description, :price)
      end
  end
end
