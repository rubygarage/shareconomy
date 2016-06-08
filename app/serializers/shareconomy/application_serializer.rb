module Shareconomy
  class ApplicationSerializer < ActiveModel::Serializer
    alias current_shareconomy_user scope
  end
end
