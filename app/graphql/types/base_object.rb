# frozen_string_literal: true

module Types
  # Base class for all graphql objects
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
  end
end
