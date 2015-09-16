require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Merchant.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
  end
end
