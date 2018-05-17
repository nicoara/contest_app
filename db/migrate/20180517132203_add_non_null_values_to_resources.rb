class AddNonNullValuesToResources < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:dancers, :name, false)
    change_column_null(:dancers, :country, false)
    change_column_null(:couples, :boy_id, false)
    change_column_null(:couples, :girl_id, false)
    change_column_null(:competitions, :name, false)
    change_column_null(:competitions, :date, false)
    change_column_null(:competitions, :country, false)
    change_column_null(:competitions, :price, false)
    change_column_null(:competitions, :currency, false)
    change_column_null(:competitions, :maxCouplesOnFloor, false)
    change_column_null(:agesections, :name, false)
    change_column_null(:divisions, :name, false)
    change_column_null(:entries, :couple_id, false)
    change_column_null(:entries, :competition_id, false)
    change_column_null(:entries, :division_id, false)
    change_column_null(:entries, :agesection_id, false)
  end
end
