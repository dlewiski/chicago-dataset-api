class InspectionViolation < ApplicationRecord
  belongs_to :inspections
  belongs_to :violations
end
