class AddNotesToVolunteers < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteers, :notes, :text
  end
end
