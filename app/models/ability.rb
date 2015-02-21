class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
        user = User.new
    end
    if user.role? :customer
      #can :read, Project    
      can :read, Project, customer_id: user.id
      can :approve, Job, project: {customer_id: user.id}
      can :manage, Concept, user_id: user.id
      can [:create,:update], Address, user_id: user.id
      can :create, Requirement
    end
    if user.role? :manager
      can :manage, Project
      can :manage, Concept
      can :manage, Attachment
      cannot :approve, Job
      cannot :create, Requirement
    end
    if user.role? :admin
      can :manage, :all
      cannot :create, Requirement
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
