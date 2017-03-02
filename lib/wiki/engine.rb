module Homeland
  module Wiki
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Wiki

      initializer 'homeland.wiki.init' do |app|
        if Setting.has_module?(:wiki)
          Homeland.register_plugin do |plugin|
            plugin.name           = 'wiki'
            plugin.display_name   = 'Wiki'
            plugin.description    = Homeland::Wiki::DESCRIPTION
            plugin.version        = Homeland::Wiki::VERSION
            plugin.navbar_link    = true
            plugin.root_path      = "/wiki"
          end

          app.routes.prepend do
            mount Homeland::Wiki::Engine, at: '/'
          end
        end
      end
    end
  end
end
