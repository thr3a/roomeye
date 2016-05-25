class Condition < ActiveRecord::Base
  validates :temp, presence: true
  validates :humid, presence: true
  validates :hpa, presence: true
end
