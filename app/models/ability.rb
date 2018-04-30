class Ability
  include CanCan::Ability

  def initialize(model)
      case model
      when Admin
        can :manage, :all
        can [:edit, :update, :destroy], Activity
        can [:edit, :update, :destroy], Resource
      when User
        can [:edit, :update, :destroy], Activity, user_id: model.id
        can [:new, :read, :create], Activity
        can [:edit, :update, :destroy], Resource, user_id: model.id
        can [:new, :read, :create], Resource
      else
        can [:new, :read, :create], Activity, id: '100000'
        can [:new, :read, :create], Resource
      end
  end
end
