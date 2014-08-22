class AvailabilityPolicy < ApplicationPolicy
  def create?
    user.present? && user.role?(:business)
  end
  def destroy?
    user.present? && record.user == user
  end
end
