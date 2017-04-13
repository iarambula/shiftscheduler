class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.references :group
      t.string :full_name
      t.string :email
      t.string :home_number
      t.string :mobile_number
      t.boolean :recieve_texts

      t.timestamps
    end
  end
end
