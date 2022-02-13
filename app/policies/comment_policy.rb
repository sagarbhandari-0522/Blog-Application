class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    super
    @user = user
    @comment = comment
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    ((@user.id == @comment.user_id) || (@user.has_role? :admin))
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
