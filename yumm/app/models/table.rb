class Table < ActiveRecord::Base
  validates :number, :guests, presence: true
end
