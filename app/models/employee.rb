class Employee < ApplicationRecord
  before_create :default_avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :department, counter_cache: true
  # Self Join
  belongs_to :manager, class_name: "Employee", optional: true
  has_many :reports, class_name: "Employee", foreign_key: "manager_id", dependent: :destroy,
                     inverse_of: "manager"
  # Avatar image
  has_one_attached :avatar
  # Polymorphic association
  has_many :feedbacks, dependent: :destroy
  has_many :receive_feedbacks, class_name: "Feedback", as: :feedbackable, dependent: :destroy

  # enums
  enum :rola, { admin: 0, regular: 1 }

  private

  def default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open("app/assets/images/avatar.png"), filename: "default_avatar.png")
  end
end
