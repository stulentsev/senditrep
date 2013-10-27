class AddImageUrlToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :image_url, :string
  end
end
