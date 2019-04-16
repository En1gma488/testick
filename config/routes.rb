Rails.application.routes.draw do
	  root "home#index"
	  resource :articles
	  
	  devise_for :users  , controllers: { sessions: 'users/sessions', registration: 'users/registration'  }
end
