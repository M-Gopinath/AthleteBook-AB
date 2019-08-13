Rails.application.routes.draw do
  # Head Mehtod response
  match 'auth/facebook/callback', to: 'home#facebook_details', via: [:get, :post]
  match 'auth/instagram/callback', to: 'home#instagram_details', via: [:get, :post]
  match 'auth/pinterest/callback', to: 'home#pinterest_details', via: [:get, :post]
  match 'auth/google/callback', to: 'home#google_details', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match '*path', via: [:options], to:  ->(_) { [200, { 'Content-Type' => 'text/plain' }, []] }

  devise_scope :user do
    post 'users/sessions/login', to: 'users/sessions#login', as: 'user_login'
  end  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
  post '/users/confirm_registration' => 'users#confirm_registration'
  get 'get_countries' => 'homes#get_countries'
  get 'get_roles' => 'homes#get_roles'
  get '/users/sessions/failure' => 'users/sessions#failure'
  delete 'sessions' => 'sessions#destroy', :as => 'sign_out'

  #User videos
  get '/user_video/add_video', to: 'user_videos#add_video', as: 'add_video'
  post '/user_video/upload_video', to: 'user_videos#upload_video', as: 'upload_video'
  delete '/user_video/remove_video/:id', to: 'user_videos#remove_video', as: 'remove_video'
  post '/user_video/add_videos', to: 'user_videos#add_videos', as: 'add_videos'
  
  # post '/users/reset_passwords' => 'users#reset_passwords'
  # post 'sessions' => 'sessions#create', :as => 'login'
  # delete 'sessions' => 'sessions#destroy', :as => 'logout'
  #
  # Athletes
  patch '/athletes', to: 'athletes#profile_field_update'
  post '/athletes/public_image', to: 'athletes#update_public_image'
  post '/athletes/cover_image', to: 'athletes#update_cover_image'
  get '/athletes/profile', to: 'athletes#profile'
  get '/athletes/skills', to: 'athletes#skills'
  post '/athletes/skills', to: 'skills#add'
  delete '/athletes/skills', to: 'skills#remove'
  post '/athletes/educations', to: 'educations#create'
  delete '/athletes/educations', to: 'educations#delete'
  put'/athletes/educations', to: 'educations#edit'
  # Search
  #get '/search', to: 'search#index'

  # Skills
  get '/skills', to: 'skills#index'
  get '/skills', to: 'skills#index'
  # Education
  get '/educations', to: 'educations#index'
  # Institution
  get '/institution', to: 'educations#institution'
  # Education Type
  get '/education_type', to: 'educations#education_type'
  #generating users stripe account id
  post '/charges/creditcard_payment', to: 'charges#creditcard_payment'
  post '/charges/user_stripe_account_id', to: 'charges#user_stripe_account_id'

  get '/payments/upgrade_plans', to: 'payments#upgrade_plans', as: 'upgrade_plans'
  get '/payments/payment_option_page/:id', to: 'payments#payment_option_page', as: 'payment_option_page'
  post '/payments/creditcard_validation',to:'payments#creditcard_validation'
  post '/payments/payment_charge',to:'payments#payment_charge'
  post '/charges/paypal_payment', to: 'charges#paypal_payment'
  post '/payments/stripe_payment', to: 'payments#stripe_payment', as: 'stripe_payment'
  #get '/charges/paypal_payment', to: 'charges#paypal_payment'
  # get '/payments/payment_charge',to:'payments#payment_charge'

  # Routes for careers controller
  get 'careers/add_career',to: 'careers#add_career' 
  post 'careers/add_career_create',to:'careers#add_career_create',as:'add_careers_create'
  get 'careers/career_edit/:career_id',to: 'careers#career_edit' ,as:'career_edit'
  put 'careers/career_update/:career_id',to: 'careers#career_update',as:'career_update'
  delete 'careers/:career_id', to: 'careers#career_destroy', as: 'career_destroy'

  # Routes for sponsors controller
  get 'sponsors/sponsor_new',to: 'sponsors#sponsor_new',as:'sponsors_new'
  post 'sponsors/sponsor_create',to:'sponsors#sponsor_create',as:'sponsor_create'
  get 'sponsors/sponsor_edit/:sponsor_id',to:'sponsors#sponsor_edit',as:'sponsor_edit'
  put 'sponsors/sponsor_update/:sponsor_id',to: 'sponsors#sponsor_update',as:'sponsor_update'
  delete 'sponsors/sponsor_destroy/:sponsor_id',to:'sponsors#sponsor_destroy',as:'sponsor_destroy'

  namespace :admin do
    devise_for :users
    get '/', to: 'dashboard#index'
    resources :users

    namespace :basic do
      resources :countries do
      end
      resources :states do
      end
      resources :cities do
      end
      resources :account_types do
      end
      resources :plans do
      end
      resources :games do
      end
    end
  end
      

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get 'home/index'
  get 'home/view'
  get 'home/edit_profile'
  post 'home/create'
  post 'home/add_education'
  post 'home/add_experiences'
  
  delete 'home/edit_profile', to: 'home#destroy'
  
  patch '/home', to: 'home#update_user_profile'
  put '/home', to: 'home#update_user_profile'
  get '/home/athletes_list'
  get '/home/athlete_campare'
  get '/home/athlete_campare_page'
  get '/home/individual_athlete/:id' => 'home#individual_athlete', as: 'individual_athlete'
  post 'home/profile_update', to: 'home#profile_field_update'
  post '/home/athletes_list', to: 'home#athletes_list', as: 'athletes_list'




#-------------------------albums--------------------------------------
get 'albums/album_new', to:'albums#album_new' ,as:'albums_new'
post 'albums/album_create',to:'albums#album_create',as:'albums/album_create'
get 'albums/picture_new',to:'albums#picture_new',as:'picture_new'
post'albums/picture_create',to:'albums#picture_create',as:'albums/picture_create'
#-------------------------albums end----------------------------------

# sponsor_update
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
