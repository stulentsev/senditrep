class AddCenterToCities < ActiveRecord::Migration
  def change
    add_column :cities, :center, :boolean
  end
end
