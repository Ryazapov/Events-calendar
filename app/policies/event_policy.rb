class EventPolicy < ApplicationPolicy
  def manage?
    user == record.user
  end
end
