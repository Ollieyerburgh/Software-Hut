class Ability
  include CanCan::Ability

  def initialize(model)
      case model
      when Admin
        can :manage, :all, id: model.id

      when User
        can [:edit, :update, :destroy], Activity, user_id: model.id
        puts model.id
        puts "HAHHAHHHAHAHHHAHHAHAHHHAHHHHAHAHHAHAHAKJLAJKAJLAKJA"
        can [:new, :read, :create], Activity
        can [:edit, :update, :destroy], Resource, user_id: model.id
        can [:new, :read, :create], Resource
      else
        can [:new, :read, :create], Activity, id: '100000'
        can [:new], Resource
      end
  end
end
