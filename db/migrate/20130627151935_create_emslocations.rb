class CreateEmslocations < ActiveRecord::Migration
  def change
    create_table :emslocations do |t|
      t.string :locationtype
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
