class CreatePcomments < ActiveRecord::Migration
  def change
  	create_table :pcomments do |t|
      t.integer :user_id
      t.integer :purchase_id
      
      t.string :body, :null => false
      
      t.timestamps
    end
    
    add_index :pcomments, [:user_id, :purchase_id]
  end
end
