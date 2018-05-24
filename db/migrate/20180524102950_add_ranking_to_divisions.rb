class AddRankingToDivisions < ActiveRecord::Migration[5.1]
  def change
    add_column :divisions, :ranking, :Integer
  end
end
