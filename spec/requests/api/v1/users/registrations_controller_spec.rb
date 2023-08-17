require 'rails_helper'

RSpec.describe Api::V1::Users::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) do
        {
          user: {
            email: "test@example.com",
            password: "password"
          }
        }
      end

      it "creates a new user with valid params" do
        post :create, params: valid_params
        expect(response).to have_http_status(:success)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to_not be_nil
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {
          user: {
            email: "invalid@email.com"
          }
        }
      end

      it "returns errors with invalid params" do
        post :create, params: invalid_params
        expect(response).to have_http_status(401)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']).to_not be_empty
      end
    end
  end
end
