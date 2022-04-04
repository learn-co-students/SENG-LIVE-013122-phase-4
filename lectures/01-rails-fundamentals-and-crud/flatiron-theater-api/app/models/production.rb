class Production < ApplicationRecord
    has_many :production_roles

    # BREAK OUT ACTIVITY #1
    
    # 1. Add Active Record Associations
    
    # Production "has_many" Tickets
    # Procution "has_many" Users through Tickets
    has_many :tickets
    has_many :users, through: :tickets
end
