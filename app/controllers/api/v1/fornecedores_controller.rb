module Api
  module V1
    class FornecedoresController < ApplicationController
      before_action :set_fornecedor, only: %i[update destroy show]

      def index
        @fornecedor = Fornecedor.all
        render json: @fornecedor
      end

      def show
        render json: @fornecedor
      end

      def create
        @fornecedor = Fornecedor.new(fornecedor_param)
        return unless @fornecedor.save

        render json: @fornecedor, status: :created
      end

      def update
        return unless @fornecedor.update(fornecedor_param)

        render json: @fornecedor, status: :ok
      end

      def destroy
        return unless @fornecedor.destroy

        render json: { sucess: 'fornecedor apagado com sucesso' }, status: :ok
      end

      def set_fornecedor
        @fornecedor = Fornecedor.find(params[:id])
      end

      private

      def fornecedor_param
        params.require(:fornecedor).permit(:nome, :cnpj, :telefone, :email, :endereco)
      end
    end
  end
end
