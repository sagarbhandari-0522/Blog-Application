# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
    super
    @user = user
    @article = article
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    ((@user.id == @article.user_id) || (@user.has_role? :admin))
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
