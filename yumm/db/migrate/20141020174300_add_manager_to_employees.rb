class AddManagerToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :manager, :boolean
  end
end
