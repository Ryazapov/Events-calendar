class Event < ApplicationRecord
  enum event_type: { once: "once", daily: "daily", weekly: "weekly", monthly: "monthly", yearly: "yearly" }

  belongs_to :user

  scope :by_date, ->(date) { where(date: date) }
  scope :before_date, ->(date) { where("date <= :date", date: date) }
  scope :by_month, ->(month) { where("extract(month from date) = :month", month: month) }

  validates :date, :event_type, presence: true
  validates :title, length: { maximum: 255 }, presence: true
  validates :description, length: { maximum: 500 }
end
