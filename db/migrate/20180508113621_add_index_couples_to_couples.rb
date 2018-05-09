class AddIndexCouplesToCouples < ActiveRecord::Migration[5.1]
  def change
    add_index :couples, [:boy_id, :girl_id], unique: true
  end
end
