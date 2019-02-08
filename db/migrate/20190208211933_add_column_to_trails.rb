class AddColumnToTrails < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :name, :string
  end
end
