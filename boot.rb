# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'homeland/wiki'

Homeland.register_plugin do |plugin|
  plugin.name              = 'wiki'
  plugin.display_name      = 'Wiki'
  plugin.description       = 'Wiki 栏目插件'
  plugin.version           = Homeland::Wiki::VERSION
  plugin.navbar_link       = true
  plugin.user_menu_link    = false
  plugin.root_path         = '/wiki'
  plugin.admin_path        = '/admin/wiki'
  plugin.admin_navbar_link = true
end
