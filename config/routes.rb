Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      mount_devise_token_auth_for 'User', at: 'auth'

    end
  end
end
