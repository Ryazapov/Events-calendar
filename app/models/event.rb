class Event < ApplicationRecord
  enum event_type: { once: "once", daily: "daily", weekly: "weekly", monthly: "monthly", yearly: "yearly" }

  belongs_to :user

  validates :start_date, :event_type, presence: true
  validates :title, length: { maximum: 255 }, presence: true
  validates :description, length: { maximum: 300 }
  validate :date_validation

  private

  def date_validation
    return unless start_date && end_date && start_date > end_date
    errors.add(:end_date, "Can't be in the past")
  end
end
