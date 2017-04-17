class CreateVolunteersShiftsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :volunteers, :shifts do |t|
      t.index :volunteer_id
      t.index :shift_id
    end
  end
end
