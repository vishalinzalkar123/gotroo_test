Rails.application.routes.draw do
  root to:'shortened_urls#index'
  resources :shortened_urls do
    collection do
      get 'shortened_urls/original_url', to: 'shortened_urls#original_url', as: 'original_url'
    end
  end
end
