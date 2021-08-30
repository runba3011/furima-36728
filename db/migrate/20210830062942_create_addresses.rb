class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number , null: false
      t.integer :prefecture_id
      t.string :city , null: false 
      t.string :building_number , null: false;
      t.string :building_name 
      t.string :phone_number
      t.references :history , null: false , foreign_key: true
      t.timestamps
    end
  end
end
