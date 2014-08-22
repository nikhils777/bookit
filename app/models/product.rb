class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking
  belongs_to :message
  validates :name, presence: true, length: { minimum: 3}
  validates :description, presence: true, length: { minimum: 3}
  validates :length, presence: true, format: { with: /\A\d{1,4}\z/}
  validates :price, presence: true, format: { with: /\A\d{1,4}\z/}
end
