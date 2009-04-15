class CreateInvoiceOperations < ActiveRecord::Migration
  def self.up
    create_table :invoice_operations do |t|
      t.string :name
      t.string :note
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_operations
  end
end
