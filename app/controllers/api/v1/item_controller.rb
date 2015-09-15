class Api::V1::ItemController < ApplicationController
  respond_to :json

  def show
    respond_with Item.find(params[:id])
  end
end
