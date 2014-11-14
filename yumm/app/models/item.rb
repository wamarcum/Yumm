class Item < ActiveRecord::Base
  belongs_to :ticket

  validates :name, presence: true
  validates :quantity, presence: true
end
