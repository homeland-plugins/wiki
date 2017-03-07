module Homeland::Wiki
  class Ability
    include CanCan::Ability

    attr_reader :user

    def initialize(u)
      @user = u
      if @user.blank?
        roles_for_anonymous
      elsif @user.roles?(:admin)
        can :manage, Page
      elsif @user.roles?(:wiki_editor)
        roles_for_wiki_editor
      else
        roles_for_anonymous
      end
    end

    protected

    def roles_for_wiki_editor
      can :create, Page
      can :update, Page, locked: false
    end

    def roles_for_anonymous
      can [:read, :recent, :preview, :comments], Page
    end
  end
end

