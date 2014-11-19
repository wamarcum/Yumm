class AddIndexToEmployees < ActiveRecord::Migration
  def change
    add_index :employees, :pin, unique: true
  end
end
