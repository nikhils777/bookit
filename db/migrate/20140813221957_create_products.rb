class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :length
      t.references :user, index: true

      t.timestamps
    end
  end
end
