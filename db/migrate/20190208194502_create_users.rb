class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :gear
      t.string :photo
      t.string :caption

      t.timestamps
    end
  end
end
