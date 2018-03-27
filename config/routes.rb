Rails.application.routes.draw do

  devise_for :users
  # get 'lists/index'
  #
  # get 'lists/show'
  #
  # get 'lists/new'
  #
  # get 'lists/create'
  #
  # get 'lists/edit'
  #
  # get 'lists/update'

  get '/:name/share' =>'lists#share',as: :share_list


    resources :lists,  param: :name, path: '/'

  get 'pages/index'

  # root to: 'lists#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
end
