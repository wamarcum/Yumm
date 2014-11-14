class Ticket < ActiveRecord::Base
  belongs_to :table

  validates :title, presence: true
  
  has_many :items
end
