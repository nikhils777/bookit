class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.text :date
      t.text :start
      t.text :end
      t.integer :uid
      t.boolean :confirmed, default: false
      t.boolean :paid, default: false
      t.references :user, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
