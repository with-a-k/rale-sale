require 'csv'

namespace :db do
  desc "TODO"
  task import: :environment do
    CSV.foreach("data/merchants.csv", :headers => true) do |row|
      m = Merchant.create({
        name:       row[1],
        created_at: row[2],
        updated_at: row[3]        
      })
      puts "Created merchant #{m.id}: #{m.name}."
    end

    CSV.foreach("data/customers.csv", :headers => true) do |row|
      c = Customer.create({
        first_name: row[1],
        last_name:  row[2],
        created_at: row[3],
        updated_at: row[4] 
      })
      puts "Created customer #{c.id}: #{c.first_name} #{c.last_name}."
    end

    CSV.foreach("data/items.csv", :headers => true) do |row|
      i = Item.create({
        name:        row[1],
        description: row[2],
        unit_price:  row[3].to_i,
        merchant_id: row[4].to_i,
        created_at:  row[5],
        updated_at:  row[6] 
      })
      puts "Created item #{i.id}: #{i.name} belonging to merchant #{i.merchant_id}."
    end

    CSV.foreach("data/invoices.csv", :headers => true) do |row|
      i = Invoice.create({
        customer_id: row[1].to_i,
        merchant_id: row[2].to_i,
        status:      row[3],
        created_at:  row[4],
        updated_at:  row[5] 
      })
      puts "Created invoice #{i.id} for customer #{i.customer_id} at merchant #{i.merchant_id}."
    end

    CSV.foreach("data/invoice_items.csv", :headers => true) do |row|
      i = InvoiceItem.create({
        item_id:     row[1].to_i,
        invoice_id:  row[2].to_i,
        quantity:    row[3].to_i,
        unit_price:  row[4].to_i,
        created_at:  row[5],
        updated_at:  row[6]
      })
      puts "Created invoice item #{i.id} for item #{i.item_id} on invoice #{i.invoice_id}."
    end

    CSV.foreach("data/transactions.csv", :headers => true) do |row|
      t = Transaction.create({
        invoice_id:                  row[1].to_i,
        credit_card_number:          row[2].to_i,
        credit_card_expiration_date: row[3],
        result:                      row[4],
        created_at:                  row[5],
        updated_at:                  row[6]
      })
      puts "Created transaction #{t.id} for invoice #{t.invoice_id}."
    end
  end
end
