class CreateSpsrLocations < ActiveRecord::Migration
  def change
    create_table :spsr_locations do |t|
      t.integer :city_id
      t.integer :city_number
      t.integer :city_owner_number
      t.string :city_name
      t.string :region_name
      t.integer :region_number
      t.integer :region_owner_number
      t.integer :country_number
      t.integer :country_owner_number

      t.timestamps
    end
  end
end
