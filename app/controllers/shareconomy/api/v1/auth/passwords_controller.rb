module Shareconomy::Api::V1::Auth
  class PasswordsController < DeviseTokenAuth::PasswordsController
    resource_description do
      short 'Passwords manager'
      api_versions 'v1'
    end

    api! 'Use this route to send a password reset confirmation email to users that registered by email.'
    param :email, String, required: true, desc: 'Email'
    param :redirect_url, String, required: true, desc: 'Redirect URL'
    error 404, 'Unable to find user with email {{email}}.'

    def create
      super
    end

    api! 'Use this route to change users passwords.'

    param :password, String, required: true, desc: 'Password'
    param :password_confirmation, String, required: true, desc: 'Password confirmation'

    def update
      super
    end
  end
end
