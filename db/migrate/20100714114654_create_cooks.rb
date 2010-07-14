class CreateCooks < ActiveRecord::Migration
  def self.up
    create_table :cooks do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :cooks
  end
end
