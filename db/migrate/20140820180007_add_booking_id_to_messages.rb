class AddBookingIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :booking_id, :integer
  end
end
