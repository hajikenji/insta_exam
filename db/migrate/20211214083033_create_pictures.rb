class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.text :image
      t.text :commnet

      t.timestamps
    end
  end
end
