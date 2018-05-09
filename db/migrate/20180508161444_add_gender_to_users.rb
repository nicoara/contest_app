class AddGenderToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :dancers, :is_boy, :Boolean
  end
end
