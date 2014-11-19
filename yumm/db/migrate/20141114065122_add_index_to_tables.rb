class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :tables, :number, unique: true
  end
end
