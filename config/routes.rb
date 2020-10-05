Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  namespace :api do
    namespace :v1 do
      namespace :disciplines do
        resources :hottest_questions, only: :index
      end

      namespace :questions do
        resources :mostly_accessed, only: :index
      end
    end
  end
end
