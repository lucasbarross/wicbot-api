Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do 
        resources :localizations
        get '/localizations/hint', to: "localizations#hint"
        resources :suggestions
        resources :answers
        get '/status', to: 'answers#status'
        resources :champions
    end
  end
end
