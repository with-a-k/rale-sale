class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    if find_value.class == String
      if find_value[0].downcase == find_value[0]
        find_value[0] = find_value[0].upcase
      end
    end
    respond_with Customer.find_by(find_params)
  end

  def find_all
    if find_value.class == String
      if find_value[0].downcase == find_value[0]
        find_value[0] = find_value[0].upcase
      end
    end
    respond_with Customer.where(find_params)
  end

  def random
    respond_with Customer.all.sample
  end

  def invoices
    respond_with Customer.find_by(id: params[:customer_id]).invoices
  end

  def transactions
    respond_with Customer.find_by(id: params[:customer_id]).transactions
  end

  def favorite_merchant
    respond_with Merchant.find_by(id: Customer.find_by(id: params[:customer_id]).favorite_merchant_id)
  end

  private

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

  def find_key
    find_params.to_h.keys.first
  end

  def find_value
    find_params.to_h.values.first
  end
end
