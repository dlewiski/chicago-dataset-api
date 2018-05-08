class Inspection < ApplicationRecord
  has_many :inspection_violations
  belongs_to :facility
end
