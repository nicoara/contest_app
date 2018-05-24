class AddIndexRankingToDivisions < ActiveRecord::Migration[5.1]
  def change
    add_index :divisions, :ranking, unique: true
  end
end
