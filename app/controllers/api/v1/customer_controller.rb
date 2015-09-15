class Api::V1::CustomerController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    respond_with Customer.find_by(find_params)
  end

  private

  def find_params
    
  end
end
