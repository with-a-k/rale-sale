require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Item.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
  end
end
