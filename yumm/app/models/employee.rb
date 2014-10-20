class Employee < ActiveRecord::Base
  validates :name, :pin, presence: true
end
