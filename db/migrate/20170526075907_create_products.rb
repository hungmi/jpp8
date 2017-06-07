class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :foreign_name
      t.string :tw_name
      t.references :category
      t.bigint :rr_price # recommended retail price
      t.bigint :ws_price # wholesale_price
      t.bigint :shipping_weight # shipping weight
      t.integer :stock
			# t.integer :ranking

      t.string :item_code
      t.string :material
			t.string :description
			t.string :product_size
			t.string :origin

      t.timestamps
    end
  end
end
