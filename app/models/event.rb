class Event < ApplicationRecord
  enum event_type: { once: "once", daily: "daily", weekly: "weekly", monthly: "monthly", yearly: "yearly" }

  belongs_to :user

  validates :date, :event_type, presence: true
  validates :title, length: { maximum: 255 }, presence: true
  validates :description, length: { maximum: 500 }
end
