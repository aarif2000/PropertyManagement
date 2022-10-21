class Ability
  include CanCan::Ability
  def initialize(user)
    # Define abilities for the user here. For example:
    if user&.role== 'Owner'
      can :manage, :property
    else
      can :index, :property
      can :manage, :booking
      can :read, :property

    end
   end
end