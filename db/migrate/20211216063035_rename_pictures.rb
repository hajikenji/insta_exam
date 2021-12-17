class RenamePictures < ActiveRecord::Migration[6.0]
  def change
    rename_table :picturestabkes, :pictures
  end
end
