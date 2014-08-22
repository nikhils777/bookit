class AddNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :name, :text
  end
end
