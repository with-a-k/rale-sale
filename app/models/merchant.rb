class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def favorite_customer
    Customer.find_by(id: invoices.successful.group_by {|invoice| invoice[:customer_id]}.values.sort_by {|group| group.size}.last.last.customer_id)
  end

  def self.most_items(params)
    merchants_by_items_sold = all.sort_by do |merchant|
      merchant.invoices.successful.joins(:invoice_items).sum(:quantity)
    end

    merchants_by_items_sold.reverse[0...params[:quantity].to_i]
  end

  def self.most_revenue(params)
    merchants_by_revenue = all.sort_by do |merchant|
      merchant.invoices.successful.joins(:invoice_items).sum('quantity * unit_price')
    end

    merchants_by_revenue.reverse[0...params[:quantity].to_i]
  end

  def self.all_revenue(params)
    date_revenue = Invoice.successful.where("invoices.created_at = '#{params[:date]}'")
           .joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
    {"total_revenue" => date_revenue}
  end

  def customers_with_pending_invoices
    failed_invoices.pending(failed_invoices.pluck(:customer_id))
  end

  def failed_invoices
    self.invoices.failed
  end

  def revenue(params)
    if params[:date]
      {"revenue" => self.invoices.successful.where("invoices.created_at = '#{params[:date]}'").joins(:invoice_items).sum('quantity * unit_price')}
    else
      {"revenue" => self.invoices.successful.joins(:invoice_items).sum('quantity * unit_price')}
    end
  end
end
