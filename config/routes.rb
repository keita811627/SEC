Rails.application.routes.draw do
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

 end


 namespace :public do

   resources :users
   get 'unsubscribe' => 'users#unsubscribe'
   patch 'users/withdraw'

   resources :questions

 end

end