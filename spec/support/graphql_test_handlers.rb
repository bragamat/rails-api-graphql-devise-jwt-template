# frozen_string_literal: true

# Helpers to better threat expectations graphql related
module GraphqlTestHandlers
  def graphql_errors
    result['errors']
  end
end
