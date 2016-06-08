module Shareconomy::Api
  class ApiController < ApplicationController
    rescue_from CanCan::AccessDenied do |exception|
      response = Shareconomy::Response.new
      response.add_error_message(exception.message)
      render json: response, status: :forbidden
    end

    rescue_from ActiveRecord::RecordNotFound do |exception|
      response = Shareconomy::Response.new
      response.add_error_message(exception.message)
      render json: response, status: :not_found
    end

    def create_entity(entity)
      if entity.save
        render json: Shareconomy::Response.new(entity, scope: current_shareconomy_user), status: :created
      else
        render json: Shareconomy::Response.new(entity, scope: current_shareconomy_user), status: :unprocessable_entity
      end
    end

    def update_entity(entity, params)
      if entity.update(params)
        render json: Shareconomy::Response.new(entity, scope: current_shareconomy_user)
      else
        render json: Shareconomy::Response.new(entity, scope: current_shareconomy_user), status: :unprocessable_entity
      end
    end

    def destroy_entity(entity)
      if entity.destroy
        render json: Shareconomy::Response.new(entity, scope: current_shareconomy_user)
      else
        render json: Shareconomy::Response.new(entity, scope: current_shareconomy_user), status: :unprocessable_entity
      end
    end
  end
end
