class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end
  end

  add_column :items, :category_id, :integer, index:true
end
