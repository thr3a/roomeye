class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.float :temp
      t.float :humid
      t.float :hpa

      t.timestamps null: false
    end
  end
end
