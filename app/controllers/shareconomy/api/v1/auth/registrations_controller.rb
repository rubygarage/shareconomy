module Shareconomy::Api::V1::Auth
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    resource_description do
      short 'Users manager'
      api_versions 'v1'
    end

    api! 'Email registration. A verification email will be sent to the email address provided.'
    param :email, String, required: true, desc: 'Email address'
    param :first_name, String, required: true, desc: 'First name'
    param :last_name, String, required: true, desc: 'Last name'
    param :password, String, required: true, desc: 'Password'
    param :password_confirmation, String, required: false, desc: 'Password confirmation'
    error 403, 'Email already in use'
    error 422, 'Validation failed'

    def create
      super do |user|
        update_profile(user)
      end
    end

    protected

    def render_create_success
      render json: Shareconomy::Response.new(@resource), status: :created
    end

    def render_create_error
      render json: Shareconomy::Response.new(@resource), status: :forbidden
    end

    def render_create_error_email_already_exists
      response = Shareconomy::Response.new(@resource)
      response.add_error_message I18n.t('devise_token_auth.registrations.email_already_exists', email: @resource.email)
      render json: response, status: :forbidden
    end

    def render_update_error
      render json: Shareconomy::Response.new(@resource), status: :forbidden
    end

    def render_update_error_user_not_found
      response = Shareconomy::Response.new(@resource)
      response.add_error_message I18n.t('devise_token_auth.registrations.user_not_found')
      render json: response, status: :not_found
    end

    def render_destroy_error
      response = Shareconomy::Response.new(@resource)
      response.add_error_message I18n.t('devise_token_auth.registrations.account_to_destroy_not_found')
      render json: response, status: :not_found
    end

    private

    def update_profile(user)
      user.profile.update!(profile_params)
    end

    def profile_params
      params.permit(:first_name, :last_name, :phone)
    end
  end
end
