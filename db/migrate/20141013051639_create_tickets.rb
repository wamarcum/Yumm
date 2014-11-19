class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.references :table, index: true

      t.timestamps
    end
  end
end
