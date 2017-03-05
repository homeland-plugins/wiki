Homeland::Wiki::Engine.routes.draw do
  resources :pages, path: 'wiki' do
    collection do
      get :recent
      post :preview
    end
    member do
      get :comments
    end
  end

  namespace :admin do
    resources :pages do
      resources :versions, controller: :page_versions do
        member do
          post :revert
        end
      end
    end
  end
end
