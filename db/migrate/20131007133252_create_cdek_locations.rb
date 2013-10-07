class CreateCdekLocations < ActiveRecord::Migration
  def change
    create_table :cdek_locations do |t|
      t.integer :num
      t.string :cityname

      t.timestamps
    end
  end
end
