Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers do
        resources :contacts do
          resources :interactions
        end
      end
    end
  end
end
