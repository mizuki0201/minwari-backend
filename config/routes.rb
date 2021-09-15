Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions',
        passwords: 'api/v1/auth/passwords',
        token_validations:  'api/v1/auth/token_validations'
      }

      resources :users, only: [:index]
      resources :friends, only: [:index, :create, :destroy]

      resources :groups, only: [:index, :create, :update, :destroy] do
        resources :events, only: [:index, :create, :update, :destroy] do
          resources :expences, only: [:index, :create, :update, :destroy]
        end
      end

      delete 'debts', to: 'debts#custom_delete'
    end
  end
end
