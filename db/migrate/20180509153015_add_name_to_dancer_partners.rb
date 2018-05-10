class AddNameToDancerPartners < ActiveRecord::Migration[5.1]
  def change
    add_column :dancer_partners, :name, :string
  end
end
