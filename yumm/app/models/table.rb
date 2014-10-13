class Table < ActiveRecord::Base
  validates :number, :guests, presence: true

  has_many :tickets, dependent: :delete_all
end

