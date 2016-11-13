Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  
  namespace :api do
    namespace :v1 do
      post '/entries/:badge_number/in', to: 'entries#in'
      post '/entries/:badge_number/out', to: 'entries#out'
    end
  end

  get 'static_pages/home', to: 'static_pages#home'
end
