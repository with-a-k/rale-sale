class Api::V1::MerchantController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id])
  end
end
