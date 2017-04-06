class MessagePolicy < ApplicationPolicy


  # this is where I was last. I'm not exactly sure how to authorize a user role to be able to use particular functions through the controllers.
  if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
  class Scope < Scope
    attr_reader :user, :message

    def initialize(user, message)
      @user  = user
      @message = message
    end

    def resolve
      scope
    end
  end
end
