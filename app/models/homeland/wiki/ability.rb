module Homeland::Wiki
  class Ability
    include CanCan::Ability

    attr_reader :user

    def initialize(u)
      @user = u
      return roles_for_create_wiki if @user.present? && (@user.roles?(:admin) || @user.roles?(:wiki_editor))
      roles_for_anonymous
    end

    protected

    def roles_for_create_wiki
      can :create, Page
      can :edit, Page, locked: false
      can :update, Page, locked: false
    end

    def roles_for_anonymous
      can [:read, :recent, :preview, :comments], Page
    end
  end
end

