class CreateScomments < ActiveRecord::Migration
  def change
    create_table :scomments do |t|
      
      t.integer :user_id
      t.integer :sale_id
      t.string :body, :null => false
      t.timestamps
    end
    add_index :scomments, [:user_id, :sale_id]
  end
end
