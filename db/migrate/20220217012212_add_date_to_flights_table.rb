class AddDateToFlightsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :date, :date
  end
end
