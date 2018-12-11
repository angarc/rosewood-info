Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, {
  	controllers: {
  		registrations: 'users/registrations',
  		sessions:      'users/sessions',
  		passwords:     'users/passwords'
  	}
  }

  resources :surveys do
    collection do
      get :search
    end
  end

  get '/dashboard', to: 'dashboard#index'
  namespace :dashboard do
    resources :surveys do
      resources :questions do
        resources :answers
      end
      member do
        post :publish
      end
    end
  end

  namespace :elko do
  	resources :authorized_surveyees_lists do
      collection do
        post :toggle_status
      end
    end

  	resources :authorized_surveyees_lists do
    end
  	resources :features do
      collection do
        post :toggle_status
      end
    end

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
