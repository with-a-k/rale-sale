require 'test_helper'

class Api::V1::CustomerControllerTest < ActionController::TestCase
  test '#show' do
    get :show, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal "Noel", customer[:first_name]
    assert_equal "Kreiss", customer[:last_name]
  end

  test '#find' do
    get :find, format: :json, id: Customer.last.id

    customer = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal "Serah", customer[:first_name]
    assert_equal "Farron", customer[:last_name]

    get :find, format: :json, first_name: "Noel"

    customer = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal "Noel", customer[:first_name]
    assert_equal "Kreiss", customer[:last_name]

    get :find, format: :json, last_name: "Kreiss"

    customer = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal "Noel", customer[:first_name]
    assert_equal "Kreiss", customer[:last_name]
  end
end
