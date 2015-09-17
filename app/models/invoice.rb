class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items

  def self.successful
    joins(:transactions).where("result = 'success'")
  end

  def self.failed
    joins(:transactions).where("result = 'failed'")
  end

  def self.pending(ids)
    Customer.where(id: ids)
  end
end
