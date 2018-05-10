class AddDancerIdToDancerPartners < ActiveRecord::Migration[5.1]
  def change
    add_column :dancer_partners, :dancer_id, :integer
  end
end
