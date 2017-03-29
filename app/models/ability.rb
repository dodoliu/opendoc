class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
      cannot :manage, :all
    elsif user.has_role?(:admin)
      can :manage, :all
    elsif user.has_role?(:manager)
      roles_for_managers
    elsif user.has_role?(:member)
      roles_for_members
      basic_read_only
    else
      roles_for_anonymous
    end
  end

  protected
    #普通管理员权限,不能管理用户和角色
    def roles_for_managers
      roles_for_groups  
      roles_for_interfaces
      roles_for_interface_params
      roles_for_interface_responses
      roles_for_members
      basic_read_only
    end

    #普通用户权限
    def roles_for_members
      cannot :manage, :all
      basic_read_only      
    end

    #未登录用户权限
    def roles_for_anonymous
      cannot :manage, :all      
    end

    def roles_for_groups
      can :create, Group
      can :edit, Group
      can :update, Group
    end
    def roles_for_interfaces
      can :create, Interface
      can :edit, Interface
      can :update, Interface
    end
    def roles_for_interface_params
      can :create, InterfaceParam
      can :edit, InterfaceParam
      can :update, InterfaceParam
    end
    def roles_for_interface_responses
      can :create, InterfaceResponse
      can :edit, InterfaceResponse
      can :update, InterfaceResponse
    end    
    def roles_for_members
      can :create, Member
      can :edit, Member
      can :update, Member
    end
    def roles_for_users
      can :create, User
      can :edit, User
      can :update, User
    end
    def roles_for_roles
      can :create, Role
      can :edit, Role
      can :update, Role
    end

    def basic_read_only
      can :read, Group
      can :read, Interface
      can :read, InterfaceParam
      can :read, InterfaceResponse
      can :read, Member
    end
end
