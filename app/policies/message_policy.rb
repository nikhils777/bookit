class MessagePolicy < ApplicationPolicy
  def create?
    record.uid == user.id || record.user_id == user.id
  end
  def destroy?
    record.uid == user.id
  end
end