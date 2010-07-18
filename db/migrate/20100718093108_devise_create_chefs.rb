class DeviseCreateChefs < ActiveRecord::Migration
  def self.up
    create_table(:chefs) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable

      t.timestamps
    end

    add_index :chefs, :email,                :unique => true
    add_index :chefs, :confirmation_token,   :unique => true
    add_index :chefs, :reset_password_token, :unique => true
    # add_index :chefs, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :chefs
  end
end
