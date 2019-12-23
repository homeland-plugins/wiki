# frozen_string_literal: true

module Homeland
  module Wiki
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Wiki

      initializer 'homeland.wiki.assets.precompile', group: :all do |app|
        app.config.assets.precompile += %w[homeland/wiki/application.css homeland/wiki/application.js]
      end

      initializer 'homeland.wiki.init' do |app|
        if Setting.has_module?(:wiki)
          Homeland.register_plugin do |plugin|
            plugin.name              = 'wiki'
            plugin.display_name      = 'Wiki'
            plugin.description       = Homeland::Wiki::DESCRIPTION
            plugin.version           = Homeland::Wiki::VERSION
            plugin.navbar_link       = true
            plugin.user_menu_link    = false
            plugin.root_path         = '/wiki'
            plugin.admin_path        = '/admin/wiki'
            plugin.admin_navbar_link = true
            plugin.spec_path         = config.root.join('spec')
          end

          app.routes.prepend do
            mount Homeland::Wiki::Engine, at: '/'
          end

          app.config.paths['db/migrate'].concat(config.paths['db/migrate'].expanded)
        end
      end
    end
  end
end
