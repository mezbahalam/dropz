class Ability
  include CanCan::Ability

  def initialize(user)
    
guest = User.new
guest.role = Role.new
guest.role.name = "Guset"
user ||= guest # Guest user
    if user.admin?
      can :manage, User
      can [:read, :edit, :update, :destroy, :add_image], Job
      cannot :create, Job
    elsif user.customer?
      can :read, Job
      can :create, Job
      can [:edit, :update, :destroy, :add_image], Job do |job|
        job.try(:user) == user
      end
    elsif user.guest?
      can :read, Job
    end
  end
end


