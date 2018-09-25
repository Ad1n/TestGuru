Rails.application.routes.draw do

  root to: 'tests#index'
  devise_for :users, path: :gurus,
                               path_names: { sign_in: :login, sign_out: :logout },
                               controllers: { registrations: 'registrations/registrations',
                                              confirmations: 'registrations/confirmations'}

  resources :messages, only: %i[new create]
  resources :badges, only: :index

  resources :tests, only: :index do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end


  #GET test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :user_badges, only: %i[index destroy]
    resources :badges, except: :show
    resources :gists
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
