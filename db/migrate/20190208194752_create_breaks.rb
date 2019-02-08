class CreateBreaks < ActiveRecord::Migration[5.2]
  def change
    create_table :breaks do |t|
      t.string :review
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
