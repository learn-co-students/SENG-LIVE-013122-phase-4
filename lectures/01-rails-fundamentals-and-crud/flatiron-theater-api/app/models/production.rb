class Production < ApplicationRecord
    # production = Production.first
    # production.production_roles
    has_many :production_roles

    # BREAK OUT ACTIVITY #1
    
    # 1. Add Active Record Associations
    has_many :tickets
    has_many :users, through: :tickets


    # Production "has_many" Tickets
    # Procution "has_many" Users through Tickets
end
