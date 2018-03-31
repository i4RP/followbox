Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/:name/share' =>'lists#share',as: :share_list
  # get '/:name/addcontact' =>'contacts#new',as: :new_contact
  # post '/:name/addcontact' =>'contacts#create',as: :create_contact

    resources :lists,  param: :name, path: '/'
    resources :contacts

  get 'pages/index'

  # root to: 'lists#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
end
