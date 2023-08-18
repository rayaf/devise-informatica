# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!

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

  def create
    order = current_user.orders.build(order_params)
    if order.valid?
      order.save
      render json: order, status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    order = current_user.orders.find(params[:id])

    if order.update(order_params)
      render json: order, status: :ok
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    order = current_user.orders.find(params[:id])
    order.destroy
    head 204
  end

  private

  def order_params
    params.require(:order).permit(:processor_id, :motherboard_id, :graphic_card_id, ram_slots_attributes: [:ram_memory_id])
  end
end
