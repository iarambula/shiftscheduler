class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :volunteer
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
