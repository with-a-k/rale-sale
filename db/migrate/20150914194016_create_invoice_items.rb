class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.integer :unit_price

      t.timestamps null: false
    end
  end
end
