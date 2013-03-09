class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :retail_price, precision: 8, scale: 2
      t.decimal :cost, precision: 8, scale: 2

      t.timestamps
    end
  end
end
