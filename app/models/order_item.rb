class OrderItem < ApplicationRecord

  enum production_status: { cannot_start: 0, waiting_for_production: 1, production: 2, production_completed: 3 }
  belongs_to :order
  belongs_to :item^
end



