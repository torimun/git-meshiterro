Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get  '/homes/about', to: 'homes#about', as: 'about'
  #以下のコードの親子関係を、「ネストする」と言います。params[:post_image_id]でPostImageのidが取得可能
  #resource部分 単数形にすると、/:idがURLに含まれなくなります。
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
