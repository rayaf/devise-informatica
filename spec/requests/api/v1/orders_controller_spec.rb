require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }

  before do
    sign_in(user)
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns a list of orders" do
      orders = create_list(:order, 3, user: user)
      get :index
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(orders.count)
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get :show, params: { id: order.id }
      expect(response).to have_http_status(:success)
    end

    it "returns the correct order" do
      get :show, params: { id: order.id }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['id']).to eq(order.id)
    end
  end

  describe "POST #create" do
    let(:processor) { create(:processor) }
    let(:motherboard) { create(:motherboard) }
    let(:ram_memory) { create(:ram_memory, size:8) }

    let(:valid_params) do
      {
        order: {
          processor_id: processor.id,
          motherboard_id: motherboard.id,
          ram_slots_attributes: [
            ram_memory_id: ram_memory.id
          ]
        }
      }
    end

    it "creates a new order with valid params" do
      post :create, params: valid_params
      expect(response).to have_http_status(:created)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['id']).to_not be_nil
    end

    it "returns errors with invalid params" do
      post :create, params: { order: { processor_id: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).to_not be_empty
    end
  end

  describe "PATCH #update" do
    let(:order) { create(:order, user: user) }
    let(:new_processor) { create(:processor) }

    it "updates the order with valid params" do
      patch :update, params: { id: order.id, order: { processor_id: new_processor.id } }
      expect(response).to have_http_status(:ok)
      order.reload
      expect(order.processor_id).to eq(new_processor.id)
    end

    it "returns errors with invalid params" do
      patch :update, params: { id: order.id, order: { processor_id: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).to_not be_empty
    end
  end

  describe "DELETE #destroy" do
    it "destroys the order" do
      delete :destroy, params: { id: order.id }
      expect(response).to have_http_status(:no_content)
      expect { order.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
