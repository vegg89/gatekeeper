Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/entries/:badge_number/in', to: 'entries#in'
      post '/entries/:badge_number/out', to: 'entries#out'
    end
  end
end
