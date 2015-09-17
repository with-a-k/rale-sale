class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    if find_value.class == String
      if find_value[0].downcase == find_value[0]
        find_value[0] = find_value[0].upcase
      end
    end
    respond_with Merchant.find_by(find_params)
  end

  def find_all
    if find_value.class == String
      if find_value[0].downcase == find_value[0]
        find_value[0] = find_value[0].upcase
      end
    end
    respond_with Merchant.where(find_params)
  end

  def random
    respond_with Merchant.all.sample
  end

  def items
    respond_with Merchant.find_by(id: params[:merchant_id]).items
  end

  def invoices
    respond_with Merchant.find_by(id: params[:merchant_id]).invoices
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:merchant_id]).favorite_customer
  end

  def most_items
    respond_with Merchant.most_items(params)
  end

  def most_revenue
    respond_with Merchant.most_revenue(params)
  end

  def customers_with_pending_invoices
    respond_with Merchant.find_by(id: params[:merchant_id]).customers_with_pending_invoices
  end

  def revenue
    respond_with Merchant.find_by(id: params[:merchant_id]).revenue(params)
  end

  def all_revenue
    respond_with Merchant.all_revenue(params)
  end

  private

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

  def find_key
    find_params.to_h.keys.first
  end

  def find_value
    find_params.to_h.values.first
  end
end
