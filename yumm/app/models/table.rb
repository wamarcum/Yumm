class Table < ActiveRecord::Base
  validates :number, presence: true
end
