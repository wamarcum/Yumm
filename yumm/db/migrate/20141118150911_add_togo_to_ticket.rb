class AddTogoToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :togo, :boolean, default: false
  end
end
