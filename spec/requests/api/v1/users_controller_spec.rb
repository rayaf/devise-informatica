require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns the correct user" do
      get :index
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['id']).to eq(user.id)
    end
  end
end
