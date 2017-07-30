class Event < ApplicationRecord
  enum event_type: { once: "once", daily: "daily", weekly: "weekly", monthly: "monthly", yearly: "yearly" }

  belongs_to :user
end
