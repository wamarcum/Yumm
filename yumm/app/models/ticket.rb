class Ticket < ActiveRecord::Base
  belongs_to :table

  has_many :items
end
