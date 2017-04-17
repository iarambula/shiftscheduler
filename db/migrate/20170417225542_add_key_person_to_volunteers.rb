class AddKeyPersonToVolunteers < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteers, :key_person, :boolean, default: false
  end
end
