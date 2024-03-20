Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  namespace :api do
    namespace :v1 do
      resources :categorias
      resources :produtos do
        post 'add_servico', to: 'produtos#add_servico_to_produto'
      end
      resources :fornecedor
      resources :servicos do
        post 'add_produto', to: 'servicos#add_produto_to_servico'
        post 'add_venda', to: 'servicos#add_venda_to_servico'
      end
      resources :vendas do
        post 'add_servico', to: 'vendas#add_servico_to_venda'
      end
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
