class User < ApplicationRecord
    # BREAK OUT ACTIVITY #1
    
    # 1. Generate Migration for User
    
    # 2. Add Active Record Associations
    # User "has_many" Tickets
    # User "has_many" Productions Through User
    has_many :tickets
    has_many :productions, through: :tickets
end