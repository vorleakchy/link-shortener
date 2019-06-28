Rails.application.routes.draw do
  root to: 'short_links#new'

  resources :short_links, only: [:new, :create, :show, :edit] do
    member do
      patch :expire
    end
  end

  get 's/:slug', to: 'short_links#short', as: :short
end
