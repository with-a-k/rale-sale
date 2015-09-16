require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test '#show' do
    get :show, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal "Noel", customer[:first_name]
    assert_equal "Vermillion", customer[:last_name]
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
    assert_equal "Vermillion", customer[:last_name]

    get :find, format: :json, last_name: "Kreiss"

    customer = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal "Noel", customer[:first_name]
    assert_equal "Kreiss", customer[:last_name]

    get :find, format: :json, last_name: "farron"

    customer = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal "Serah", customer[:first_name]
    assert_equal "Farron", customer[:last_name]
  end

  test '#find_all' do
    get :find_all, format: :json, first_name: "noel"

    customers = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, customers.count
  end

  test '#random' do
    get :random, format: :json

    customer = JSON.parse(response.body, symbolize_names: true)
    first_names = ["Noel", "Serah"]
    last_names  = ["Vermillion", "Kreiss", "Farron"]

    assert_response :success
    assert first_names.include?(customer[:first_name])
    assert last_names.include?(customer[:last_name])
  end

  test '#transactions' do
    get :transactions, format: :json, id: Customer.last.id
  end
end
