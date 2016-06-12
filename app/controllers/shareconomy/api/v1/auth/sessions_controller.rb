module Shareconomy::Api::V1::Auth
  class SessionsController < DeviseTokenAuth::SessionsController
    resource_description do
      short 'Sessions manager'
      api_versions 'v1'
    end

    skip_after_action :update_auth_header, only: [:create]

    api! 'Email authentication.'
    param :email, String, desc: 'Email address', required: true
    param :password, String, desc: 'Password', required: true
    error 401, 'Invalid login credentials. Please try again.'
    error 401, 'A confirmation email was sent to your account at {{email}}.' \
               'You must follow the instructions in the email before your account ' \
               'can be activated'
    def create
      super
    end

    api! "Use this route to end the user's current session. This route will invalidate the user's authentication token."

    def destroy
      super
    end

    protected

    def render_create_success
      update_auth_header
      render json: Shareconomy::Response.new(@resource)
    end

    def render_create_error_not_confirmed
      response = Shareconomy::Response.new
      response.add_error_message I18n.t('devise_token_auth.sessions.not_confirmed', email: @resource.email)
      render json: response, status: 401
    end

    def render_create_error_bad_credentials
      response = Shareconomy::Response.new
      response.add_error_message I18n.t('devise_token_auth.sessions.bad_credentials')
      render json: response, status: 401
    end
  end
end
