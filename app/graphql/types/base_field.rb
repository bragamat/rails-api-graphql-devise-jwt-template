# frozen_string_literal: true

module Types
  # Base field type
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument
  end
end
