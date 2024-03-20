module Api
  module V1
    class CategoriasController < ApplicationController
      before_action :set_categorium, only: %i[update destroy show]

      def index
        @categorium = Categorium.all
        render json: @categorium
      end

      def show
        render json: @categorium
      end

      def create
        @categorium = Categorium.new(categorium_params)
        return unless @categorium.save

        render json: @categorium, status: :created
      end

      def update
        return unless @categorium.update(categorium_params)

        render json: @categorium, status: :ok
      end

      def destroy
        return unless @categorium.destroy

        render json: { success: 'Categoria apagada com sucesso!' }, status: :ok
      end

      def set_categorium
        @categorium = Categorium.find(params[:id])
      end

      private

      def categorium_params
        params.require(:categorium).permit(:nome, :descricao)
      end
    end
  end
end
