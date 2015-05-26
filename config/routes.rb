Rails.application.routes.draw do



  devise_for :users
  resources :users, only: [:update]

   resources :topics do
     resources :posts, except: [:index]
   end
 
   resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
   end

 
  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'

  get 'advertisement' =>'welcome#advertisement'

root to: 'welcome#index'

end