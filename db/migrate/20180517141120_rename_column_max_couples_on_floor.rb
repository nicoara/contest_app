class RenameColumnMaxCouplesOnFloor < ActiveRecord::Migration[5.1]
  def change
    rename_column :competitions, :maxCouplesOnFloor, :max_couples_on_floor
  end
end
