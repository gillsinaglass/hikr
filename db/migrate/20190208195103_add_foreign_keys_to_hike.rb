class AddForeignKeysToHike < ActiveRecord::Migration[5.2]
  def change
    add_reference :hikes, :trail, foreign_key: true
    add_reference :hikes, :user, foreign_key: true
  end
end
