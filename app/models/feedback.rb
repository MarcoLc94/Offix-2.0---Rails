class Feedback < ApplicationRecord
  belongs_to :employee
  belongs_to :feedbackable, polymorphic: true
end
