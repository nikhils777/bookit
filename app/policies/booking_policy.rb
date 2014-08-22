class BookingPolicy < ApplicationPolicy
  def create?
    user.present? && record.user == user
  end
  def destroy?
    record.uid == user.id || record.user_id == user.id
  end
  def update?
    record.uid == user.id
  end
end