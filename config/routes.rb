Rails.application.routes.draw do
      resources :articles
      resources :users
      root to: 'articles#index'
	  get 'article/fatch_import', to: 'articles#fatch_import'
	  get 'article/source_import', to: 'articles#source_import'
      devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registration'  }
end
