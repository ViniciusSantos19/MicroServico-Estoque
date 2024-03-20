module Api
  module V1
    class EstoquesController < ApplicationController
      before_action :set_estoque, only: %i[update destroy show]

      def index
        @estoque = Estoque.all
        redner json: @estoque
      end

      def show
        render json: @estoque
      end

      def create
        @estoque = Estoque.new(estoque_params)
        return unless @estoque.save

        render json: @estoque, status: :created
      end

      def update
        return unless @estoque.update(estoque_params)

        render json: @estoque, status: :ok
      end

      def destroy
        return unless @estoque.destroy

        render json: { sucess: 'estoque apagado com sucesso' }, status: :ok
      end

      def set_estoque
        @estoque = Estoque.find(params[:id])
      end

      private

      def estoque_params
        params.require(:estoque).permit(:quantidade, :data_entrada, :data_saida)
      end
    end
  end
end
