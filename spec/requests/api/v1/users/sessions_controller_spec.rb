require 'rails_helper'

RSpec.describe Api::V1::Users::SessionsController, type: :controller do
  include Devise::Test::ControllerHelpers
  
  let(:user) { create(:user) }

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.headers["Accept"] = "application/json"
  end

  describe "POST #create" do
    let(:valid_params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    it "creates a new session with valid params" do
      post :create, params: valid_params
      expect(response).to have_http_status(:success)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['id']).to_not be_nil
    end

    it "returns errors with invalid params" do
      post :create, params: { user: { email: "invalid@example.com", password: "invalid" } }
      expect(response).to have_http_status(:unauthorized)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['error']).to_not be_nil
    end
  end

  describe "DELETE #destroy" do
    it "destroys the user session" do
      delete :destroy
      expect(response).to have_http_status(:no_content)
      expect(controller.user_signed_in?).to be_falsey
    end
  end
end
