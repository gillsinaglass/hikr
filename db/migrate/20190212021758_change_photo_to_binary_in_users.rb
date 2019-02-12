class ChangePhotoToBinaryInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :photo, :binary
  end
end
