Rails.application.routes.draw do

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

  resources :lists,  param: :name, path: '/'

  get ':name/share' =>'lists#share'

  get 'pages/index'

  # root to: 'lists#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
end
