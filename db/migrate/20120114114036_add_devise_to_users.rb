class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :crypted_password
    remove_column :users, :salt
    remove_column :users, :remember_token
    remove_column :users, :remember_token_expires_at

    add_column :users, :encrypted_password, :string, null: false, default: ''
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
