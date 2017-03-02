Rails.application.routes.draw do
  mount Homeland::Wiki::Engine => "/homeland-wiki"
end
