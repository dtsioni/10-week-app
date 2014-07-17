class Ability

  include CanCan::Ability


  def initialize(user)

    #create guest user if signed out
    user ||= User.new
    case user.role
    when "admin"
      #admin privileges
      can :manage, :all

      can :edit_roles, :all
      
      
    when "moderator"
      #mod privileges      
      can :update, :all
      can :edit, :all

      can :edit, User do |foo|
        foo && foo.role != "admin"
      end

      cannot :update, User do |foo|
        foo && foo.role == "admin"
      end

      can :delete, :all
      can :create, :all
      can :write, :all
      can :show, :all

      cannot :control, :pages
    when "author"
      #author privileges
      can :read, :all
      can :write, Comment
      can :write, Post
      can :create, Comment
      can :create, Post
      #can edit comments they authored
      can :update, Comment do |comment|
        comment && comment.user_id == user.id
      end
      #can delete comments they authored
      can :delete, Comment do |comment|
        comment && comment.user_id == user.id
      end
      #can edit posts they authored
      can :update, Post do |post|
        post && post.user_id == user.id
      end
      #can delete posts they authored
      can :delete, Post do |post|
        post && post.user_id == user.id
      end
      cannot :control, :pages
    #guest privileges
    else
      can :read, :all
      can :new, User
      cannot :control, :pages

    end
  end
end