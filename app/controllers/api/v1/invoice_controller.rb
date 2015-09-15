class Api::V1::InvoiceController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.find(params[:id])
  end
end
