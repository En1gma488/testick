Rails.application.routes.draw do
	  root "home#index"
	  resource :articles
	  get 'articles', to: 'home#article'
	  devise_for :users  , controllers: { sessions: 'users/sessions', registration: 'users/registration'  }
end
