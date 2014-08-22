class Message < ActiveRecord::Base
  belongs_to :user
  has_one :product
  validates :bdate, presence: true, format: { with:  /\A\d{0,2}\/\d{0,2}\/\d{2,4}\z/ }
  validates :booking_id, presence: true
  validates :ctime, presence: true
  validates :info, presence: true
  validates :uid, presence: true
  validates :user_id, presence: true
  validates :name, presence: true

end
