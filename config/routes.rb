Rails.application.routes.draw do
      devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registration'  }
	
      resources :articles
      resources :users
      resources :sources

      root to: 'articles#index'
      
	  get 'article/fatch_import', to: 'articles#fatch_import'
	  get 'article/source_import', to: 'articles#source_import'
end
