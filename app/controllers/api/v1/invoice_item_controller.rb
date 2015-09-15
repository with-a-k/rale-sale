class Api::V1::InvoiceItemController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:id])
  end
end
