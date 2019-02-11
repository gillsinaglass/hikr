class AddColumnToBreaks < ActiveRecord::Migration[5.2]
  def change
    add_column :breaks, :rating, :integer
  end
end
