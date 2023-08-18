# frozen_string_literal: true

# Controller responsável pelas operações relacionadas a pedidos (orders) na API V1.
class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!

  # Obtém uma lista de pedidos (orders) associados ao usuário autenticado.
  # Podendo pesquisar e ordenar as pedidos (orders)
  #
  # GET /api/v1/orders
  def index
    orders = current_user.orders.ransack(params[:q]).result
    
    render json: orders, include: [
      :processor,
      :motherboard,
      :graphic_card,
      ram_slots: {
        include: [:ram_memory]
        }
      ]
  end

  # Obtém detalhes de um pedido específico associado ao usuário autenticado.
  #
  # GET /api/v1/orders/:id
  # @param id [Integer] O ID do pedido a ser buscado.
  def show
    order = current_user.orders.find(params[:id])

    render json: order, include: [
      :processor,
      :motherboard,
      :graphic_card,
      ram_slots: {
        include: [:ram_memory]
        }
      ]
  end

  # Cria um novo pedido associado ao usuário autenticado.
  #
  # POST /api/v1/orders
  # {
  #   "order": {
  #     "processor_id": 1,
  #     "motherboard_id": 2,
  #     "graphic_card_id": 3,
  #     "ram_slots_attributes": [
  #       { "ram_memory_id": 4 },
  #       { "ram_memory_id": 5 }
  #     ]
  #   }
  # }
  def create
    order = current_user.orders.build(order_params)
    if order.valid?
      order.save
      render json: order, status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Atualiza um pedido existente associado ao usuário autenticado.
  #
  # PATCH /api/v1/orders/:id
  # @param id [Integer] O ID do pedido a ser atualizado.
  # {
  #   "order": {
  #     "processor_id": 1,
  #     "motherboard_id": 2,
  #     "graphic_card_id": 3,
  #     "ram_slots_attributes": [
  #       { "ram_memory_id": 4 },
  #       { "ram_memory_id": 6 }
  #     ]
  #   }
  # }
  def update
    order = current_user.orders.find(params[:id])

    if order.update(order_params)
      render json: order, status: :ok
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Exclui um pedido associado ao usuário autenticado.
  #
  # DELETE /api/v1/orders/:id
  # @param id [Integer] O ID do pedido a ser excluído.
  def destroy
    order = current_user.orders.find(params[:id])
    order.destroy
    head 204
  end

  private

  # Parâmetros permitidos para criação/atualização de um pedido.
  #
  # @return [ActionController::Parameters] Os parâmetros permitidos.
  def order_params
    params.require(:order).permit(:processor_id, :motherboard_id, :graphic_card_id, ram_slots_attributes: [:ram_memory_id])
  end
end
