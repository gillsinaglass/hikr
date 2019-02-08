class AddForeignKeysToShelter < ActiveRecord::Migration[5.2]
  def change
    add_reference :shelters, :trail, foreign_key: true
  end
end
