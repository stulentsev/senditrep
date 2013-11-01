class RenameColumnCdek < ActiveRecord::Migration
  def change
  	rename_column :cdek_locations, :cityname, :city_name
  end
end
