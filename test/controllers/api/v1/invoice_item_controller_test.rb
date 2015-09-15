require 'test_helper'

class Api::V1::InvoiceItemControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: InvoiceItem.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
  end
end
