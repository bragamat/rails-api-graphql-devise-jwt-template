# frozen_string_literal: true

module Types
  # Loads queries into schema
  # include other queries and resolvers here
  class QueryType < BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, resolver: Resolvers::Users::Me

    field :users, resolver: Resolvers::Users::Users
    field :user, resolver: Resolvers::Users::User
  end
end
