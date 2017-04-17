class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.integer :day
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
