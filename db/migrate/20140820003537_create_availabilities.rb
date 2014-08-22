class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.text :date
      t.text :start
      t.text :end
      t.references :user, index: true

      t.timestamps
    end
  end
end
