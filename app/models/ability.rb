# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    can :read, Recipe, public: true
    return unless user.present?
    can :read, :all if user.role == 'guest'
    can :manage, Recipe, user: user
    can :manage, Inventory, user: user
    can :manage, Food, user: user
    can :manage, :all if user.role == 'admin'
    can :manage, :all if user.role == 'default'
    
  end
end
