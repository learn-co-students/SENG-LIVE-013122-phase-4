class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.float :price
      t.integer :user_id
      t.integer :production_id

      t.timestamps
    end
  end
end
