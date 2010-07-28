class ChangeDateTimeFromInt < ActiveRecord::Migration
  def self.up
    change_table :todos do |t|
        t.change :completed_date, :datetime
    end
  end

  def self.down
    change_table :todos do |t|
        t.change :completed_date, :integer
    end
  end
end
