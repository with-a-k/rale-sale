class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def favorite_customer_id
    invoices.group_by { |invoice| invoice[:customer_id] }
            .values.max_by { |group| group.size }
            .sample[:customer_id]
  end
end
