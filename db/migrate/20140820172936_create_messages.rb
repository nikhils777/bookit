class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :bstart
      t.text :b_end
      t.text :bdate
      t.integer :uid
      t.text :info
      t.references :user, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
