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
    resources :reservations, only: [:show, :create] do
      member do
        post :confirm
        post :back
      end
    end
  end

  namespace :admin do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :admins, only: [:show, :edit, :update] do
      member do
        get :my_page
      end
    end
    resources :genres, only: [:new, :show, :create, :edit, :update]
    resources :items, only: [:new, :create, :show, :edit, :update]
    resources :reservations, only: [:index, :update] do
      member do
        patch :withdraw
      end
    end
    resources :articles
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
