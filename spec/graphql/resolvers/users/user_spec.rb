# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Users::User, type: :request do
  subject(:graphql!) { result }

  let!(:admin) do
    create(:user, :admin)
  end

  let(:result) do
    GraphqlSchema.execute(
      query_string,
      variables: variables,
      context: context
    )
  end

  let(:query_string) do
    <<-GRAPHQL
    query($id: ID!) {
      user(id: $id){
        id
        email
        firstName
        lastName
      }
    }
    GRAPHQL
  end

  let(:context) do
    { current_user: admin }
  end

  describe 'user' do
    context 'when user is not member of this' do
      let(:user) do
        create(:user)
      end

      let(:variables) do
        { 'id' => user.id }
      end

      it 'returns' do
        graphql!
        expect(result['data']['user']).to be_nil
      end
    end

    context 'when user is admin of this' do
      let(:user) do
        create(:user)
      end

      let(:variables) do
        { 'id' => user.id }
      end

      it 'can access users profile' do
        graphql!
        user_email = result['data']['user']['email']
        expect(user_email).to eq(user.email)
      end
    end

    context 'when user is member of this' do
      let(:user) do
        create(:user)
      end

      let(:user2) do
        create(:user)
      end

      let(:context) do
        { current_user: user }
      end

      let(:variables) do
        { 'id' => user2.id }
      end

      it 'can access users profile' do
        graphql!
        user_email = result['data']['user']['email']
        expect(user_email).to eq(user2.email)
      end
    end
  end
end
