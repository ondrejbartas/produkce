class CreateReceptionContacts < ActiveRecord::Migration
  def self.up
    create_table :reception_contacts do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :email
      t.string :web
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :reception_contacts
  end
end
