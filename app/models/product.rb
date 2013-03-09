class Product < ActiveRecord::Base
  attr_accessible :cost, :description, :image_url, :retail_price, :sku, :title
end
