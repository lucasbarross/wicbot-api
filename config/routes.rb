Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do 
        get '/localizations/hint', to: "localizations#hint"
        resources :localizations
        resources :suggestions
        delete '/answers/reset', to: 'answers#reset'
        resources :answers
        get '/status', to: 'answers#status'
        get '/rank', to: 'answers#lastToComplete'
        resources :champions
    end
    
    namespace 'v2' do 
        get '/champions', to: 'champions#getOne'
    end
  end
end
