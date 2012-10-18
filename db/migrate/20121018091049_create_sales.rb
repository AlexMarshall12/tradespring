class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :sales, [:user_id, :created_at]
  end
end