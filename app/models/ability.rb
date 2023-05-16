# frozen_string_literal: true

# Defines abilities for user
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, to: :crud

    return if user.new_record?

    case user.role.to_sym
    when :superadmin
      can :access, :rails_admin         # grant access to rails_admin
      can :manage, :all                 # admins can manage all objects
    when :admin
      can :crud, User
    else
      can :read, User, id: user.id
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
