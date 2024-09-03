Rails.application.routes.draw do
  get 'follow_requests/create'
  get 'follow_requests/update'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  root 'posts#index'
  resources :posts, only: [:index, :create] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]  # This line ensures `post_comments_path` works
  end
  
end
