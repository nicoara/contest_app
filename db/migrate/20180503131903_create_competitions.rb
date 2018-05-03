class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|
      t.string :name
      t.date :date
      t.string :country
      t.integer :price
      t.string :currency
      t.integer :maxCouplesOnFloor

      t.timestamps
    end
  end
end
