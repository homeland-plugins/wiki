module Homeland::Wiki
  module ApplicationHelper
    delegate :comments_path, to: :main_app

    def page_title_tag(page)
      return '' if page.blank?
      link_to(page.title, page_path(page.slug), class: 'page')
    end
  end
end
