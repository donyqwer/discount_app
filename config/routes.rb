Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :offers
  match 'offer/claim/:id' => 'offers#claim', :via => [:get], as: :claim_offer
end
