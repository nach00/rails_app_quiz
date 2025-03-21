class Job < ApplicationRecord
  # Validations
  validates :employer_name, presence: true
  validates :job_title, presence: true
  
  # You can add more validations as needed
end
