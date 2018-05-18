class RenameColumnAgesectionIdInEntry < ActiveRecord::Migration[5.1]
  def change
    rename_column :entries, :agesection_id, :age_section_id
  end
end
