class Ability
  include CanCan::Ability

  def initialize(model)
      case model
      when Admin
        can :manage, :all
        can [:edit, :update, :destroy], Activity
        can [:edit, :update, :destroy], Resource
        cannot [:create, :new, :edit, :destroy], Theme unless model.higher_access?
        cannot [:create, :new, :edit, :destroy], Subject if !model.higher_access?
        cannot [:create, :new, :edit, :destroy], Age if !model.higher_access?
        cannot [:create, :new, :edit, :destroy], Delivery if !model.higher_access?
        cannot [:edit, :destroy], User if !model.higher_access?
        cannot [:create, :new, :edit], Admin if !model.higher_access?

      when User
        can [:edit, :update, :destroy], Activity, user_id: model.id
        can [:new, :read, :create], Activity
        can [:edit, :update, :destroy], Resource, user_id: model.id
        can [:new, :edit, :update, :destroy, :create, :read], Preference, user_id: model.id
        can [:new, :read, :create], Resource
      else
        can [:new, :read, :show, :create], Activity
        can [:new, :read, :create], Resource
      end
  end
end
