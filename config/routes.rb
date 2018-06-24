Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :curriculums, except: :new do
    resources :pull_requests, only: %i(create update destroy)
  end
end
