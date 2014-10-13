class Table < ActiveRecord::Base
  validates :number, :guests, presence: true

  has_many :tickets
end
