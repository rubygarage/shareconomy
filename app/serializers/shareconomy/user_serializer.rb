module Shareconomy
  class UserSerializer < ApplicationSerializer
    attributes :id, :provider, :uid, :email

    has_one :profile, serializer: ProfileSerializer
  end
end
