Rails.application.routes.draw do
  namespace :admin do
    get 'requests/index'
  end
  namespace :public do
    get 'requests/new'
    get 'requests/index'
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

 root to: 'public/homes#top'

 namespace :admin do

  resources :genres

  resources :question_statuses

  resources :users

  resources :requests

 end


 namespace :public do

   get 'unsubscribe' => 'users#unsubscribe'
   patch 'users/withdraw'
   resources :users do
       collection do
           get 'search'
       end
   end
   resources :questions do
       resources :answers do
           resource :favorites, only: [:create, :destroy]
      end
   end
   get 'search' => 'questions#search'

   resources :requests

 end

end