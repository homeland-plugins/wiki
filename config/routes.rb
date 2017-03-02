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
end
