class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :seats
      t.text :origin
      t.text :destination
      t.integer :airplane_id
    end
  end
end
