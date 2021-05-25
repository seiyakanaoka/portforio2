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

  scope module: :public do
    root 'homes#top'
    resources :admins, only: [:index, :show]
    resources :customers, only: [:show, :edit]
    resources :items, only: [:index, :show]
    resources :reservations, only: [:show, :create]
  end

  namespace :admin do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :genres, only: [:new, :show, :create, :edit, :update]
    resources :items, only: [:new, :create, :show, :edit, :update]
    resources :admins, only: [:show, :edit, :update] do
      member do
        get :my_page
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
