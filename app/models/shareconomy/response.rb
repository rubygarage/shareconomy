module Shareconomy
  class Response
    include ActiveModel::Serialization

    attr_reader :status, :data, :error

    def initialize(data = nil, element_serializer = nil, **opts)
      @opts = opts
      @element_serializer = element_serializer
      @error_messages = []
      @details = {}
      prepare(data) if data
    end

    def attributes
      {
        'status' => status,
        'data' => @data,
        'error' => error
      }
    end

    def prepare(data)
      set_data_serializer(data)
      set_errors(data)
    end

    def error
      result = {
        error_messages: @error_messages,
        details: @details
      }
      result
    end

    def status
      if success?
        'success'
      else
        'error'
      end
    end

    def add_error_message(msg)
      @error_messages << msg
    end

    def success?
      @error_messages.empty? && @details.empty?
    end

    private

    def get_element_serializer(collection)
      return @element_serializer if @element_serializer

      if collection.exists?
        ActiveModel::Serializer.serializer_for(collection.first)
      else
        "#{collection.model.name}Serializer".constantize
      end
    end

    def set_data_serializer(data)
      serializer = if data.is_a?(ActiveRecord::Relation)
                     ActiveModel::Serializer.serializer_for(data)
                   else
                     @element_serializer || ActiveModel::Serializer.serializer_for(data)
                   end
      raise "Serializer not found for #{data.class.name}" unless serializer
      @data = serializer.new(data, @opts)
      if data.is_a?(ActiveRecord::Relation)
        element_serializer = get_element_serializer(data)
        @data.root = element_serializer.root_name.pluralize
      end
    end

    def set_errors(data)
      if data.is_a?(ActiveRecord::Base) && data.errors.any?
        @error_messages += data.errors.full_messages
        @details.merge! data.errors.to_hash
      end
    end
  end
end
