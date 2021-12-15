class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :my_image, :text
  end
end
