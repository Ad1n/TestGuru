Rails.application.routes.draw do

  root to: 'tests#index'
  devise_for :users, path: :gurus,
                               path_names: { sign_in: :login, sign_out: :logout },
                               controllers: { registrations: 'registrations/registrations' }

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
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
