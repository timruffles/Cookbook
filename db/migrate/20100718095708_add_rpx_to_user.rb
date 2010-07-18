class AddRpxToUser < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.string :rpx_identifier
    end
  end

  def self.down
    change_table(:users) do |t|
      t.remove :rpx_identifier
    end
  end
end
