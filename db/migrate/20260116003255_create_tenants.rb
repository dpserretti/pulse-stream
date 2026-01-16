class CreateTenants < ActiveRecord::Migration[8.1]
  def change
    create_table :tenants do |t|
      t.string :name, null: false
      t.string :subdomain, null: false

      t.timestamps
    end
    add_index :tenants, :subdomain, unique: true
  end
end

class AddTenantToUsers < ActiveRecord::Migration[8.1]
  def change
    # Ensure every user belongs to a tenant
    add_reference :users, :tenant, null: false, foreign_key: true
  end
end