Rails.application.routes.draw do
      resource :articles
      root to: 'articles#index'
      devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registration'  }
end
