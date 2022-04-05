class ProductionRole < ApplicationRecord
  # production_role = ProductionRole.first
  # production_role.production
  
  belongs_to :production
end
