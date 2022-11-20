class Item < ApplicationRecord
 has_one_attached :image
 belongs_to :genre, optional: true

 validates :image, presence: true
 validates :name, presence: true
 validates :detail, presence: true
 validates :price, presence: true
 
 def with_tax_price
  (price*1.1).floor
 end


end
