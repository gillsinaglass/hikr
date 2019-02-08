class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :description
      t.integer :difficulty_level
      t.float :distance

      t.timestamps
    end
  end
end
