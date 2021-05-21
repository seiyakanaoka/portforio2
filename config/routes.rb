Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  scope module: :customers do
    root 'homes#top'
  end

  namespace :admins do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :genres, only: [:show, :create, :edit, :update]
    resources :items, only: [:new, :create, :show, :edit, :update]
    resources :admins, only: [:show, :edit, :update] do
      member do
        get :my_page
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
