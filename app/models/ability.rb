class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.guest
        # Guest permissions
        can :read, [Artist, Album, Genre, Post, Song, Review]
        can :read, User, id: user.id
        can :create, Review

      else
        # User permissions
        can :read, :all
        can :create, [Artist, Album, Genre, Post, Song, Review]
        can :update, Post, user_id: user.id
        can :update, User, id: user.id
        can :update, [Album, Song]
        can :destroy, [Review, Post], user_id: user.id
      end
      # Common permissions
      can :update, Review, user_id: user.id
    end
  end
end
