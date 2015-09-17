class Item < ActiveRecord::Base
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_items(params)
    top_sold = Invoice.successful.joins(:invoice_items).group(:item_id)
            .sum('quantity').sort_by{ | pair | pair.last }.reverse

    top_sold[0...params[:quantity].to_i].map(&:first).map { |id| Item.find_by_id(id) }
  end

  def self.most_revenue(params)
    top_revenue = Invoice.successful.joins(:invoice_items).group("invoice_items.item_id")
            .sum(("quantity * unit_price")).sort_by{ | pair | pair.last }.reverse

    top_revenue[0...params[:quantity].to_i].map(&:first).map { |id| Item.find_by_id(id) }
  end

  def best_day
    top_day = invoices.successful.group('invoices.created_at')
      .sum(('quantity * unit_price'))
      .sort_by { |group| group.last }.reverse.first.first
    {"best_day" => top_day}
  end
end
