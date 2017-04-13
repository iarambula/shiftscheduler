class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.string :title
      t.integer :starts_at
      t.integer :ends_at

      t.timestamps
    end
  end
end
