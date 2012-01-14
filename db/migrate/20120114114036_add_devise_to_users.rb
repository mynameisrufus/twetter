class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :crypted_password, :encrypted_password
    remove_column :users, :salt
    remove_column :users, :remember_token
    remove_column :users, :remember_token_expires_at
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
