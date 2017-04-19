class AddShiftReferenceToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :shift
  end
end
