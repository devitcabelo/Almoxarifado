Rails.application.routes.draw do
  devise_for :usuarios
  
  resources :material_quantidades, only: [:index]  
  resources :materiais
  resources :registros, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'material_quantidades/new/:acao', to: 'material_quantidades#new', as: :new_material_quantidade
  post 'material_quantidades/registrar/:acao', to: 'material_quantidades#registrar', as: :registrar_material_quantidade
  patch 'material_quantidades/registrar/:acao', to: 'material_quantidades#registrar', as: :patch_registrar_material_quantidade

  root to: "home#index"

end
