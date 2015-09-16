class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def favorite_merchant_id
    invoices.group_by { |invoice| invoice[:merchant_id] }
            .values.max_by { |group| group.size }
            .sample[:merchant_id]
  end
end
