# This page contains all the routes for the book app.
# Containing all calls to the controller classes.
# Created 4-1-19 by Anna Yu
# Edited 4-10-19 by Anna Yu : added about and contact pages
# Edited 4-13-19 by Celia Tang: added search page
# Edited 4-13-19 by Anna Yu: added devise and authentication and changed root path to sign in page.
# Edited 4-13-19 by Kordell Stewart: added resources for books
# Edited 4/14/19 by Renzhi Hu: added user profile, library, review, comment page
# Edited 4/14/19 by Renzhi Hu: redirected the authenticated page after logged in
# Edited 4/14/19 by Leslie Zhou: add comments/reviews routes
# Edited 4-16-19 by Celia Tang: added routes to entertainment and education routes
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/search', to: 'searches#search', via: [:get, :post], :as => 'search_page'

  match '/entertainment', to: 'searches#entertainment_search', via: [:get, :post], :as => 'entertainment_page'

  match '/education', to: 'searches#education_search', via: [:get, :post], :as => 'education_page'

  resources :books

  resources :books do
    resources :reviews
  end
  resources :books do
    resources :comments
  end

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'static_pages#home', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root 'devise/sessions#new'

  get '/user/profile', to: 'users#profile'

  get '/user/library', to: 'users#library'

  get '/user/review', to: 'users#review'

  get '/user/comment', to: 'users#comment'

  get '/home', to: 'static_pages#home'

  get '/help', to: 'static_pages#help'

  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

end