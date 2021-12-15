class RenamePictureCommnet < ActiveRecord::Migration[6.0]
  def change
    rename_column :pictures, :commnet, :comment
  end
end
