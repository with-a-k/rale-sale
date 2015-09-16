class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    if find_value.class == String
      if find_value[0].downcase == find_value[0]
        find_value[0] = find_value[0].upcase
      end
    end
    respond_with InvoiceItem.find_by(find_params)
  end

  def find_all
    if find_value.class == String
      if find_value[0].downcase == find_value[0]
        find_value[0] = find_value[0].upcase
      end
    end
    respond_with InvoiceItem.where(find_params)
  end

  def random
    respond_with InvoiceItem.all.sample
  end

  def invoice
    respond_with InvoiceItem.find(params[:invoice_item_id]).invoice
  end

  def item
    respond_with InvoiceItem.find(params[:invoice_item_id]).item
  end

  private

  def find_params
    params.permit(:id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at)
  end

  def find_key
    find_params.to_h.keys.first
  end

  def find_value
    find_params.to_h.values.first
  end
end
