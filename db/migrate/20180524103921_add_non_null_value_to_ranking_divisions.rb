class AddNonNullValueToRankingDivisions < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:divisions, :ranking, false)
  end
end
