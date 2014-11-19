class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.integer :quantity
      t.float :cost
      t.text :comment
      t.references :ticket, index: true

      t.timestamps
    end
  end
end
