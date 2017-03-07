module Homeland::Wiki
  class ApplicationController < ::ApplicationController
    helper ApplicationHelper

    def current_ability
      @current_ability ||= Homeland::Wiki::Ability.new(current_user)
    end
  end
end
