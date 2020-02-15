# frozen_string_literal: true

module Homeland
  module Wiki
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Wiki

      initializer 'homeland.wiki.migrate' do |_app|
        Homeland.migrate_plugin(File.expand_path('../../../migrate', __dir__))
      end

      initializer 'homeland.wiki.init' do |app|
        app.routes.prepend do
          mount Homeland::Wiki::Engine, at: '/'
        end
      end
    end
  end
end
