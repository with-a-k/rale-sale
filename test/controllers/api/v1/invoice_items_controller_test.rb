require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: InvoiceItem.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal 1, invoice[:quantity]
    assert_equal 4, invoice[:unit_price]
  end

  test '#find' do
    get :find, format: :json, id: Invoice.last.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1, invoice[:quantity]
    assert_equal 1, invoice[:unit_price]

    get :find, format: :json, unit_price: 4

    invoice = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal 1, invoice[:quantity]

    get :find, format: :json, quantity: 1

    invoice = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal 4, invoice[:unit_price]
  end

  test '#find_all' do
    get :find_all, format: :json, quantity: 1

    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2, invoices.count
  end

  test '#random' do
    get :random, format: :json

    invoice = JSON.parse(response.body, symbolize_names: true)
    unit_prices = [1, 4]

    assert_response :success
    assert unit_prices.include?(invoice[:unit_price])
  end
end
