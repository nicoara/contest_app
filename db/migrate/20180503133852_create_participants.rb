class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.integer :couple_id
      t.integer :competition_id
      t.integer :division_id
      t.integer :agesection_id

      t.timestamps
    end
  end
end
