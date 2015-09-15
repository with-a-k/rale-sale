require 'test_helper'

class Api::V1::InvoiceControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
  end
end
