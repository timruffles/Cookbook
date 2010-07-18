class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.int :step_id
      t.int :user_id
      t.int :state
      t.date :reminder_date

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
