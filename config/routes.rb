ChosenModality::Application.routes.draw do
  root :to => "practitioners#index"
  resources :modalities
  resources :practitioners
end
