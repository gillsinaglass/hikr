class AddForeignKeysToBreak < ActiveRecord::Migration[5.2]
  def change
    add_reference :breaks, :shelter, foreign_key: true
    add_reference :breaks, :user, foreign_key: true
  end
end
