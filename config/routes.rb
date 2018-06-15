Rails.application.routes.draw do
  devise_for :usuarios
  
  resources :material_quantidades, only: [:index, :create]  
  resources :materiais
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'material_quantidades/new/:acao', to: 'material_quantidades#new', as: :new_material_quantidade
  root to: "home#index"
end
