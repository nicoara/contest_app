class CreateCouples < ActiveRecord::Migration[5.1]
  def change
    create_table :couples do |t|
      t.integer :boy_id
      t.integer :girl_id

      t.timestamps
    end
  end
end
