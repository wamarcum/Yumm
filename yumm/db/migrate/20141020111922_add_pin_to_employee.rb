class AddPinToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :pin, :string, limit: 2
  end
end
