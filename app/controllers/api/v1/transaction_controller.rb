class Api::V1::TransactionController < ApplicationController
  respond_to :json

  def show
    respond_with Transaction.find(params[:id])
  end
end
