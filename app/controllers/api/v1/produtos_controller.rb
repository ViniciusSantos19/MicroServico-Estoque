module Api
  module V1
    class ProdutosController < ApplicationController
      before_action :set_produto, only: %i[show destroy update add_servico_to_produto]

      def index
        @produto = Produto.all
        render json: @produto
      end

      def show
        render json: @produto
      end

      def create
        @produto = Produto.new(produto_params)
        return unless @produto.save

        render json: @produto, status: :created
      end

      def update
        return unless @produto.update(produto_params)

        render json: @produto, status: :ok
      end

      def destroy
        return unless @produto.destroy

        render json: { sucess: 'produto apagado com sucesso' }, status: :ok
      end

      def add_servico_to_produto
        servico = Servico(params[:servico_id])
        render status: :not_found if servico.nil?

        @produto.servicos << servico
        @produto.save

        render status: :created
      end

      def set_produto
        @produto = Produto.find(params[:id])
      end

      private

      def produto_params
        params.require(:produto).permit(:nome, :descricao, :quantidade_em_estoque, :preco_de_custo, :preco_de_venda,
                                        fornecedor: [:id], categorium: [:id])
      end
    end
  end
end
