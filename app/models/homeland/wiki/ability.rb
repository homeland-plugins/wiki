# frozen_string_literal: true

module Homeland::Wiki
  class Ability
    include CanCan::Ability

    attr_reader :user

    def initialize(u)
      @user = u

      if @user.blank?
        roles_for_anonymous
      elsif @user.admin?
        roles_for_maintainer
      elsif @user.maintainer?
        roles_for_maintainer
      elsif @user.wiki_editor?
        roles_for_wiki_editor
      else
        roles_for_anonymous
      end
    end

    protected

    def roles_for_maintainer
      can :manage, Page
    end

    def roles_for_wiki_editor
      can :create, Page
      can :update, Page, locked: false
    end

    def roles_for_anonymous
      can %i[read recent preview comments], Page
    end
  end
end
