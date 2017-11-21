class Ability
  include CanCan::Ability

  def initialize(user)
    if  user != nil
      if user.has_role? :admin
        can :manage, :all
      else
        can :manage, Court
        can :manage, CriminalRecord
        can :manage, Entity
        can :manage, Hearing
        can :manage, Judge
        can :manage, LawyerAction
        can :manage, LegalCase
        can :manage, Reclusion
        can :manage, Shift
        can :manage, Suspect
        can :manage, TransferCase
        can :manage, Visit
        can :view, User
      end
    end
  end
end
