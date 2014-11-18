class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :ticket

  validates :name, presence: true
  validates :quantity, presence: true
  validates :category_id, presence: true

end
