Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, {
  	controllers: {
  		registrations: 'users/registrations',
  		sessions:      'users/sessions',
  		passwords:     'users/passwords'
  	}
  }

  get '/dashboard', to: 'dashboard#index'
  namespace :dashboard do
    resources :surveys do
      resources :questions
    end
  end

  namespace :elko do
  	resources :answers do
      collection do
        post :toggle_status
      end
    end

  	resources :surveys do
      collection do
        post :toggle_status
      end
      resources :questions do
        collection do
          post :toggle_status
        end
      end
    end
  end
  
end
