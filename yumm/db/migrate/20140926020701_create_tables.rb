class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :number
      t.string :guests

      t.timestamps
    end
  end
end
