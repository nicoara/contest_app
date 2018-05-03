class CreateDancers < ActiveRecord::Migration[5.1]
  def change
    create_table :dancers do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
