class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    if find_value.class == String
      if find_value[0].downcase == find_value[0]
        find_value[0] = find_value[0].upcase
      end
    end
    respond_with Item.find_by(find_params)
  end

  def find_all
    if find_value.class == String
      if find_value[0].downcase == find_value[0]
        find_value[0] = find_value[0].upcase
      end
    end
    respond_with Item.where(find_params)
  end

  def random
    respond_with Item.all.sample
  end

  def merchant
    respond_with Item.find_by(id: params[:item_id]).merchant
  end

  def invoice_items
    respond_with Item.find_by(id: params[:item_id]).invoice_items
  end

  private

  def find_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

  def find_key
    find_params.to_h.keys.first
  end

  def find_value
    find_params.to_h.values.first
  end
end
