Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  devise_for :user, path: :gurus,
    path_names: { sign_in: :login, sign_out: :logout },
    controllers: { sessions: 'user/sessions' }

  resources :tests, only: :index do

    member do
      post :start
    end
  end

  resources :test_progresses, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    root 'tests#index'
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
