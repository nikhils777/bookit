class AddCtimeToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :ctime, :text
  end
end
