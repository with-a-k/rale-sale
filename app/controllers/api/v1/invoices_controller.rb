class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    respond_with Invoice.find_by(find_params)
  end

  def find_all
    respond_with Invoice.where(find_params)
  end

  def random
    respond_with Invoice.all.sample
  end

  def transactions
    respond_with Invoice.find(params[:invoice_id]).transactions
  end

  def invoice_items
    respond_with Invoice.find(params[:invoice_id]).invoice_items
  end

  def items
    respond_with Invoice.find(params[:invoice_id]).items
  end

  def customer
    respond_with Invoice.find(params[:invoice_id]).customer
  end

  def merchant
    respond_with Invoice.find(params[:invoice_id]).merchant
  end

  private

  def find_params
    params.permit(:id, :status, :customer_id, :merchant_id, :last_name, :created_at, :updated_at)
  end

  def find_key
    find_params.to_h.keys.first
  end

  def find_value
    find_params.to_h.values.first
  end
end
