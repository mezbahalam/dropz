Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {registrations: 'registrations'}
  scope "/admin" do
    resources :users
  end
  
  resources :jobs do
    resources :job_images
    member do
      get :add_image
    end
  end

  get 'post-a-job',       to: "jobs#new_with_sign_up",    as: :postajob
  get 'post-a-job/login', to: "jobs#new_with_sign_in",    as: :postajob_sign_in
  
  resources :roles
  get 'staticpages/home'
  get 'staticpages/contact'
  get 'staticpages/help'

  authenticated :user do
    root :to => 'jobs#index', as: :authenticated_root
  end
  root :to => 'staticpages#home'
end


