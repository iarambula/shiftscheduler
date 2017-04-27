class AddShiftDateToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :shift_date, :date
  end
end
