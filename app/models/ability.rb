class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can(:manage, Category, user:)
    can(:manage, Operation, user:)
    can :manage, CategoryOperation
  end
end
