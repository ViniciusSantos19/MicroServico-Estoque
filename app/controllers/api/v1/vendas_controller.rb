module Api
  module V1
    class VendasController < ApplicationController
      before_action :set_venda, only: %i[show destroy update add_servico_to_venda]

      def index
        @vendas = Venda.all
        render json: @vendas
      end

      def show
        render json: @venda
      end

      def create
        @venda = Venda.create(venda_params)
        return unless @venda.save

        render json: @venda, status: :created
      end

      def update
        return unless @venda.update(venda_params)

        render json: @venda, status: :ok
      end

      def destroy
        return unless @venda.destroy

        render json: { sucess: 'venda apagada com sucesso' }, status: :ok
      end

      def add_servico_to_venda
        servico = Servico.find(params[:servico_id])
        render status: :not_found if servico.nil?
        @venda.servicos << servico
        @venda.save

        render status :created
      end

      def set_venda
        @venda = Venda.find(params[:id])
      end

      def venda_params
        params.require(:venda).permit(:data, :hora, :valor_total, :forma_pagamento)
      end
    end
  end
end
