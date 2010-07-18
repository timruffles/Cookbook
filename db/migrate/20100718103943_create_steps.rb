class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.int :recipe_id
      t.text :text
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :steps
  end
end
