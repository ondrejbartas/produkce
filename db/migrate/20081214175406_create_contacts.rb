class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :address
      t.string :email
      t.string :phone
      t.string :note
      t.boolean :deleted
      t.integer :company_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
