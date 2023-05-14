Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'edit', to: 'devise/registrations#edit', as: :edit_user_registration
    put '', to: 'devise/registrations#update', as: :user_registration
  end
  
  root 'home#index'
  resources :contacts, controller: 'contact_us', only: [:new, :create]
  resources :portfolios, only: [:show]
  resources :services, only: [:show]

  namespace :admin do
    resources :dashboards, only: [:index]
    resources :services
    resources :categories, except: [:show]
    resources :portfolios
    resources :teams
    resources :contacts, path: 'contact-us', only: [:index, :show, :destroy, :update] do
      collection do
        patch :mark_all_as_read
      end
      member do
        patch :mark_as
      end      
    end
    resources :settings
    resources :abouts, path: 'about-us'
    resources :technologies, except: [:show]
    resources :client_reviews, path: 'reviews'
  end
end
