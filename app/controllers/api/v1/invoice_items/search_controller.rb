class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(search_params))
  end

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(search_params).order(:id))
  end

  private

  def search_params
    params[:unit_price] = params[:unit_price].to_r * 100 if params[:unit_price]
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
