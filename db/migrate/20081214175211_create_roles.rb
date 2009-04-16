class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.integer :idd
      t.string :name
      t.string :comment

      t.timestamps
    end

    ad = Role.create(:idd=> "3", :name => "ADMIN", :comment => "admimnistrátor")
    wo = Role.create(:idd=> "5", :name => "WORKER", :comment => "pracovník")
    pro = Role.create(:idd=> "7", :name => "PRODUCE", :comment => "produkční")
    acc = Role.create(:idd=> "11", :name => "ACCOUNTANT", :comment => "účetní")
    cli = Role.create(:idd=> "13", :name => "CLIENT", :comment => "klient")
    exw = Role.create(:idd=> "17", :name => "EXTWORKER", :comment => "externí pracovník")

  end

  def self.down
    drop_table :roles
  end
end
