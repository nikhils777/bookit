class Availability < ActiveRecord::Base
  belongs_to :user
  validates :date, presence: true, format: { with:  /\A\d{0,2}\/\d{0,2}\/\d{2,4}\z/ }
  validates :start, presence: true, length: { minimum: 3}
  validates :end, presence: true, length: { minimum: 3}
end
