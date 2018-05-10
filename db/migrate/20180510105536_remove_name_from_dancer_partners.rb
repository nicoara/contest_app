class RemoveNameFromDancerPartners < ActiveRecord::Migration[5.1]
  def change
    remove_column :dancer_partners, :name
  end
end
