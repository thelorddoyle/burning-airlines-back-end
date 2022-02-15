class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :row
      t.integer :column
      t.integer :flight_id
      t.integer :user_id
    end
  end
end
