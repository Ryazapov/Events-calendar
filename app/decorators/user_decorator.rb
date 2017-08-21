class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email
end
