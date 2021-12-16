class CreatePicturestabke < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.text :image
      t.text :comment
    end
  end
end
