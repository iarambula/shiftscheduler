class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.references :group
      t.string :full_name
      t.text :additional
      t.integer :count, default: 1
      t.string :home_number
      t.string :mobile_number
      t.boolean :recieve_texts
      t.string :email

      t.timestamps
    end
  end
end
