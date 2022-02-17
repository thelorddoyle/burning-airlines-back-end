class RemoveFlightDateFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :flight_date, :date
  end
end
