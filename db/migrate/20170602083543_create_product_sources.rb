class CreateProductSources < ActiveRecord::Migration[5.1]
  def change
    create_table :product_sources do |t|
      t.belongs_to :product, index: true
      t.belongs_to :source, index: true

      t.timestamps
    end
  end
end
