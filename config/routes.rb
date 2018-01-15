Rails.application.routes.draw do
  resources :localizations
  resources :guild_preferences
  resources :suggestions
  resources :answers
  resources :champions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      
    end
  end
end
