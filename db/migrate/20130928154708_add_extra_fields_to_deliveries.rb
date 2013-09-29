class AddExtraFieldsToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :extra1, :string
    add_column :deliveries, :extra2, :string
    add_column :deliveries, :extra3, :string
  end
end
