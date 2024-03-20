module Api
  module V1
    class ServicosController < ApplicationController
      before_action :set_servico, only: %i[show destroy update add_produto_to_servico add_venda_to_servico]

      def index
        @servico = Servico.all
        render json: @servico
      end

      def show
        render json: @servico
      end

      def update
        return unless @servico.update(params_servico)

        render json: @servico, status: :ok
      end

      def destroy
        return unless @servico.destroy

        render json: { sucess: 'servico deletado com sucesso' }, status: :ok
      end

      def add_produto_to_servico
        produto = Produto.find(params[:produto_id])
        render status :not_found if produto.nil?
        @servico.produtos << produto
        @servico.save
        render status: :created
      end

      def add_venda_to_servico
        venda = Venda.find(params[:venda_id])
        render status: :not_found if venda.nil?
        @servico.vendas << venda
        redner status: :ok
      end

      def set_servico
        @servico = Servico.find(parmas[:id])
      end

      private

      def params_servico
        params.require(:servico).permit(:nome, :descricao, :duracao, :preco)
      end
    end
  end
end
