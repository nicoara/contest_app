class DropDancerPartners < ActiveRecord::Migration[5.1]
  def change
    drop_table :dancer_partners
  end
end
