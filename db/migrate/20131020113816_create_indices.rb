class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      t.integer :city_index
      t.integer :city_id

      t.timestamps
    end
  end
end
