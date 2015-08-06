Rails.application.routes.draw do

  root to: 'main#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :vacancies, except: [:new, :edit] do
        get 'workers', on: :member
      end
      resources :workers, except: [:new, :edit] do
        get 'vacancies', on: :member
      end
      resources :skills, except: [:new, :edit]
    end
  end
 
end
