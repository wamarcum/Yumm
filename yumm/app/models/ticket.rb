class Ticket < ActiveRecord::Base
  belongs_to :table

  validates :title, presence: true
end
