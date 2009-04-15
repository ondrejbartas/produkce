class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :project_id
      t.string :note
      t.timestamp :date
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
