class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    respond_with Item.where(find_params).first
  end

  def find_all
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

  def most_items
    respond_with Item.most_items(params)
  end

  def most_revenue
    respond_with Item.most_revenue(params)
  end

  def best_day
    respond_with Item.find_by(id: params[:item_id]).best_day
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
