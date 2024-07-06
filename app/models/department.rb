class Department < ApplicationRecord
  has_one_attached :cover
  has_many :employees, dependent: :destroy
  # Polymorphic association
  has_many :receive_feedbacks, class_name: "Feedback", as: :feedbackable, dependent: :destroy
end
