Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do
      resources :apartments
      resources :resorts do
        resources :apartments
      end
    end
  end

  match "*path", to: "application#catch_404", via: :all
end
