class AddPhotoToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :photo_file_name, :string
    add_column :purchases, :photo_content_type, :string
    add_column :purchases, :photo_file_size, :integer
  end
end
