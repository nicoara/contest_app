class RenameAgesections < ActiveRecord::Migration[5.1]
  def change
    rename_table :agesections, :age_sections
  end
end
