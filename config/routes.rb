Rails.application.routes.draw do

  post "/graphql", to: "graphql#execute"
  get '/graphql', to: 'graphql#execute'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

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
