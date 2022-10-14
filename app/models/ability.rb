# frozen_string_literal: true

 class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
      if user.role=='student'
      can :manage, :booking
      else 
      can :manage, :all
      end
 
   end
end
